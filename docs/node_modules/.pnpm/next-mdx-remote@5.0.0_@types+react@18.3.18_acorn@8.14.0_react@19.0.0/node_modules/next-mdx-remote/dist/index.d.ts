/**
 * Copyright (c) HashiCorp, Inc.
 * SPDX-License-Identifier: MPL-2.0
 */
import './idle-callback-polyfill.js';
import React from 'react';
import * as mdx from '@mdx-js/react';
import type { MDXRemoteSerializeResult } from './types.js';
type RequestIdleCallbackHandle = number;
type RequestIdleCallbackOptions = {
    timeout?: number;
};
type RequestIdleCallbackDeadline = {
    readonly didTimeout: boolean;
    timeRemaining: () => number;
};
declare global {
    interface Window {
        requestIdleCallback: (callback: (deadline: RequestIdleCallbackDeadline) => void, opts?: RequestIdleCallbackOptions) => RequestIdleCallbackHandle;
        cancelIdleCallback: (handle: RequestIdleCallbackHandle) => void;
    }
}
export type MDXRemoteProps<TScope = Record<string, unknown>, TFrontmatter = Record<string, unknown>> = MDXRemoteSerializeResult<TScope, TFrontmatter> & {
    /**
     * A object mapping names to React components.
     * The key used will be the name accessible to MDX.
     *
     * For example: `{ ComponentName: Component }` will be accessible in the MDX as `<ComponentName/>`.
     */
    components?: React.ComponentProps<typeof mdx.MDXProvider>['components'];
    /**
     * Determines whether or not the content should be hydrated asynchronously, or "lazily"
     */
    lazy?: boolean;
};
export { MDXRemoteSerializeResult };
/**
 * Renders compiled source from next-mdx-remote/serialize.
 */
export declare function MDXRemote<TScope, TFrontmatter>({ compiledSource, frontmatter, scope, components, lazy, }: MDXRemoteProps<TScope, TFrontmatter>): React.JSX.Element;
