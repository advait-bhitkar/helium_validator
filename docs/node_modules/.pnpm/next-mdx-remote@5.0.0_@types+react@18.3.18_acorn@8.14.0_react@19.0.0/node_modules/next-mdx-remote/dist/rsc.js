/**
 * Copyright (c) HashiCorp, Inc.
 * SPDX-License-Identifier: MPL-2.0
 */
import React from 'react';
import { jsxRuntime } from './jsx-runtime.cjs';
import { serialize } from './serialize.js';
export async function compileMDX({ source, options, components = {}, }) {
    const { compiledSource, frontmatter, scope } = await serialize(source, options, 
    // Enable RSC importSource
    true);
    // if we're ready to render, we can assemble the component tree and let React do its thing
    // first we set up the scope which has to include the mdx custom
    // create element function as well as any components we're using
    const fullScope = Object.assign({
        opts: jsxRuntime,
    }, { frontmatter }, scope);
    const keys = Object.keys(fullScope);
    const values = Object.values(fullScope);
    // now we eval the source code using a function constructor
    // in order for this to work we need to have React, the mdx createElement,
    // and all our components in scope for the function, which is the case here
    // we pass the names (via keys) in as the function's args, and execute the
    // function with the actual values.
    const hydrateFn = Reflect.construct(Function, keys.concat(`${compiledSource}`));
    const Content = hydrateFn.apply(hydrateFn, values).default;
    return {
        content: React.createElement(Content, { components: components }),
        frontmatter,
    };
}
/**
 * Renders compiled source from next-mdx-remote/serialize.
 */
export async function MDXRemote(props) {
    const { content } = await compileMDX(props);
    return content;
}
