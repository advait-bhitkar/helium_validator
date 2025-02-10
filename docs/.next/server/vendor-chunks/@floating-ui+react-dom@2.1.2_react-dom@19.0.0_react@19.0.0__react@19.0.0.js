"use strict";
/*
 * ATTENTION: An "eval-source-map" devtool has been used.
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file with attached SourceMaps in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
exports.id = "vendor-chunks/@floating-ui+react-dom@2.1.2_react-dom@19.0.0_react@19.0.0__react@19.0.0";
exports.ids = ["vendor-chunks/@floating-ui+react-dom@2.1.2_react-dom@19.0.0_react@19.0.0__react@19.0.0"];
exports.modules = {

/***/ "(ssr)/./node_modules/.pnpm/@floating-ui+react-dom@2.1.2_react-dom@19.0.0_react@19.0.0__react@19.0.0/node_modules/@floating-ui/react-dom/dist/floating-ui.react-dom.mjs":
/*!************************************************************************************************************************************************************************!*\
  !*** ./node_modules/.pnpm/@floating-ui+react-dom@2.1.2_react-dom@19.0.0_react@19.0.0__react@19.0.0/node_modules/@floating-ui/react-dom/dist/floating-ui.react-dom.mjs ***!
  \************************************************************************************************************************************************************************/
/***/ ((__unused_webpack___webpack_module__, __webpack_exports__, __webpack_require__) => {

eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export */ __webpack_require__.d(__webpack_exports__, {\n/* harmony export */   arrow: () => (/* binding */ arrow),\n/* harmony export */   autoPlacement: () => (/* binding */ autoPlacement),\n/* harmony export */   autoUpdate: () => (/* reexport safe */ _floating_ui_dom__WEBPACK_IMPORTED_MODULE_0__.autoUpdate),\n/* harmony export */   computePosition: () => (/* reexport safe */ _floating_ui_dom__WEBPACK_IMPORTED_MODULE_0__.computePosition),\n/* harmony export */   detectOverflow: () => (/* reexport safe */ _floating_ui_dom__WEBPACK_IMPORTED_MODULE_0__.detectOverflow),\n/* harmony export */   flip: () => (/* binding */ flip),\n/* harmony export */   getOverflowAncestors: () => (/* reexport safe */ _floating_ui_dom__WEBPACK_IMPORTED_MODULE_1__.getOverflowAncestors),\n/* harmony export */   hide: () => (/* binding */ hide),\n/* harmony export */   inline: () => (/* binding */ inline),\n/* harmony export */   limitShift: () => (/* binding */ limitShift),\n/* harmony export */   offset: () => (/* binding */ offset),\n/* harmony export */   platform: () => (/* reexport safe */ _floating_ui_dom__WEBPACK_IMPORTED_MODULE_0__.platform),\n/* harmony export */   shift: () => (/* binding */ shift),\n/* harmony export */   size: () => (/* binding */ size),\n/* harmony export */   useFloating: () => (/* binding */ useFloating)\n/* harmony export */ });\n/* harmony import */ var _floating_ui_dom__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @floating-ui/dom */ \"(ssr)/./node_modules/.pnpm/@floating-ui+dom@1.6.13/node_modules/@floating-ui/dom/dist/floating-ui.dom.mjs\");\n/* harmony import */ var _floating_ui_dom__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @floating-ui/dom */ \"(ssr)/./node_modules/.pnpm/@floating-ui+utils@0.2.9/node_modules/@floating-ui/utils/dist/floating-ui.utils.dom.mjs\");\n/* harmony import */ var react__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! react */ \"(ssr)/./node_modules/.pnpm/next@15.0.4_react-dom@19.0.0_react@19.0.0__react@19.0.0/node_modules/next/dist/server/route-modules/app-page/vendored/ssr/react.js\");\n/* harmony import */ var react_dom__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! react-dom */ \"(ssr)/./node_modules/.pnpm/next@15.0.4_react-dom@19.0.0_react@19.0.0__react@19.0.0/node_modules/next/dist/server/route-modules/app-page/vendored/ssr/react-dom.js\");\n\n\n\n\n\n\nvar index = typeof document !== 'undefined' ? react__WEBPACK_IMPORTED_MODULE_2__.useLayoutEffect : react__WEBPACK_IMPORTED_MODULE_2__.useEffect;\n\n// Fork of `fast-deep-equal` that only does the comparisons we need and compares\n// functions\nfunction deepEqual(a, b) {\n  if (a === b) {\n    return true;\n  }\n  if (typeof a !== typeof b) {\n    return false;\n  }\n  if (typeof a === 'function' && a.toString() === b.toString()) {\n    return true;\n  }\n  let length;\n  let i;\n  let keys;\n  if (a && b && typeof a === 'object') {\n    if (Array.isArray(a)) {\n      length = a.length;\n      if (length !== b.length) return false;\n      for (i = length; i-- !== 0;) {\n        if (!deepEqual(a[i], b[i])) {\n          return false;\n        }\n      }\n      return true;\n    }\n    keys = Object.keys(a);\n    length = keys.length;\n    if (length !== Object.keys(b).length) {\n      return false;\n    }\n    for (i = length; i-- !== 0;) {\n      if (!{}.hasOwnProperty.call(b, keys[i])) {\n        return false;\n      }\n    }\n    for (i = length; i-- !== 0;) {\n      const key = keys[i];\n      if (key === '_owner' && a.$$typeof) {\n        continue;\n      }\n      if (!deepEqual(a[key], b[key])) {\n        return false;\n      }\n    }\n    return true;\n  }\n  return a !== a && b !== b;\n}\n\nfunction getDPR(element) {\n  if (typeof window === 'undefined') {\n    return 1;\n  }\n  const win = element.ownerDocument.defaultView || window;\n  return win.devicePixelRatio || 1;\n}\n\nfunction roundByDPR(element, value) {\n  const dpr = getDPR(element);\n  return Math.round(value * dpr) / dpr;\n}\n\nfunction useLatestRef(value) {\n  const ref = react__WEBPACK_IMPORTED_MODULE_2__.useRef(value);\n  index(() => {\n    ref.current = value;\n  });\n  return ref;\n}\n\n/**\n * Provides data to position a floating element.\n * @see https://floating-ui.com/docs/useFloating\n */\nfunction useFloating(options) {\n  if (options === void 0) {\n    options = {};\n  }\n  const {\n    placement = 'bottom',\n    strategy = 'absolute',\n    middleware = [],\n    platform,\n    elements: {\n      reference: externalReference,\n      floating: externalFloating\n    } = {},\n    transform = true,\n    whileElementsMounted,\n    open\n  } = options;\n  const [data, setData] = react__WEBPACK_IMPORTED_MODULE_2__.useState({\n    x: 0,\n    y: 0,\n    strategy,\n    placement,\n    middlewareData: {},\n    isPositioned: false\n  });\n  const [latestMiddleware, setLatestMiddleware] = react__WEBPACK_IMPORTED_MODULE_2__.useState(middleware);\n  if (!deepEqual(latestMiddleware, middleware)) {\n    setLatestMiddleware(middleware);\n  }\n  const [_reference, _setReference] = react__WEBPACK_IMPORTED_MODULE_2__.useState(null);\n  const [_floating, _setFloating] = react__WEBPACK_IMPORTED_MODULE_2__.useState(null);\n  const setReference = react__WEBPACK_IMPORTED_MODULE_2__.useCallback(node => {\n    if (node !== referenceRef.current) {\n      referenceRef.current = node;\n      _setReference(node);\n    }\n  }, []);\n  const setFloating = react__WEBPACK_IMPORTED_MODULE_2__.useCallback(node => {\n    if (node !== floatingRef.current) {\n      floatingRef.current = node;\n      _setFloating(node);\n    }\n  }, []);\n  const referenceEl = externalReference || _reference;\n  const floatingEl = externalFloating || _floating;\n  const referenceRef = react__WEBPACK_IMPORTED_MODULE_2__.useRef(null);\n  const floatingRef = react__WEBPACK_IMPORTED_MODULE_2__.useRef(null);\n  const dataRef = react__WEBPACK_IMPORTED_MODULE_2__.useRef(data);\n  const hasWhileElementsMounted = whileElementsMounted != null;\n  const whileElementsMountedRef = useLatestRef(whileElementsMounted);\n  const platformRef = useLatestRef(platform);\n  const openRef = useLatestRef(open);\n  const update = react__WEBPACK_IMPORTED_MODULE_2__.useCallback(() => {\n    if (!referenceRef.current || !floatingRef.current) {\n      return;\n    }\n    const config = {\n      placement,\n      strategy,\n      middleware: latestMiddleware\n    };\n    if (platformRef.current) {\n      config.platform = platformRef.current;\n    }\n    (0,_floating_ui_dom__WEBPACK_IMPORTED_MODULE_0__.computePosition)(referenceRef.current, floatingRef.current, config).then(data => {\n      const fullData = {\n        ...data,\n        // The floating element's position may be recomputed while it's closed\n        // but still mounted (such as when transitioning out). To ensure\n        // `isPositioned` will be `false` initially on the next open, avoid\n        // setting it to `true` when `open === false` (must be specified).\n        isPositioned: openRef.current !== false\n      };\n      if (isMountedRef.current && !deepEqual(dataRef.current, fullData)) {\n        dataRef.current = fullData;\n        react_dom__WEBPACK_IMPORTED_MODULE_3__.flushSync(() => {\n          setData(fullData);\n        });\n      }\n    });\n  }, [latestMiddleware, placement, strategy, platformRef, openRef]);\n  index(() => {\n    if (open === false && dataRef.current.isPositioned) {\n      dataRef.current.isPositioned = false;\n      setData(data => ({\n        ...data,\n        isPositioned: false\n      }));\n    }\n  }, [open]);\n  const isMountedRef = react__WEBPACK_IMPORTED_MODULE_2__.useRef(false);\n  index(() => {\n    isMountedRef.current = true;\n    return () => {\n      isMountedRef.current = false;\n    };\n  }, []);\n  index(() => {\n    if (referenceEl) referenceRef.current = referenceEl;\n    if (floatingEl) floatingRef.current = floatingEl;\n    if (referenceEl && floatingEl) {\n      if (whileElementsMountedRef.current) {\n        return whileElementsMountedRef.current(referenceEl, floatingEl, update);\n      }\n      update();\n    }\n  }, [referenceEl, floatingEl, update, whileElementsMountedRef, hasWhileElementsMounted]);\n  const refs = react__WEBPACK_IMPORTED_MODULE_2__.useMemo(() => ({\n    reference: referenceRef,\n    floating: floatingRef,\n    setReference,\n    setFloating\n  }), [setReference, setFloating]);\n  const elements = react__WEBPACK_IMPORTED_MODULE_2__.useMemo(() => ({\n    reference: referenceEl,\n    floating: floatingEl\n  }), [referenceEl, floatingEl]);\n  const floatingStyles = react__WEBPACK_IMPORTED_MODULE_2__.useMemo(() => {\n    const initialStyles = {\n      position: strategy,\n      left: 0,\n      top: 0\n    };\n    if (!elements.floating) {\n      return initialStyles;\n    }\n    const x = roundByDPR(elements.floating, data.x);\n    const y = roundByDPR(elements.floating, data.y);\n    if (transform) {\n      return {\n        ...initialStyles,\n        transform: \"translate(\" + x + \"px, \" + y + \"px)\",\n        ...(getDPR(elements.floating) >= 1.5 && {\n          willChange: 'transform'\n        })\n      };\n    }\n    return {\n      position: strategy,\n      left: x,\n      top: y\n    };\n  }, [strategy, transform, elements.floating, data.x, data.y]);\n  return react__WEBPACK_IMPORTED_MODULE_2__.useMemo(() => ({\n    ...data,\n    update,\n    refs,\n    elements,\n    floatingStyles\n  }), [data, update, refs, elements, floatingStyles]);\n}\n\n/**\n * Provides data to position an inner element of the floating element so that it\n * appears centered to the reference element.\n * This wraps the core `arrow` middleware to allow React refs as the element.\n * @see https://floating-ui.com/docs/arrow\n */\nconst arrow$1 = options => {\n  function isRef(value) {\n    return {}.hasOwnProperty.call(value, 'current');\n  }\n  return {\n    name: 'arrow',\n    options,\n    fn(state) {\n      const {\n        element,\n        padding\n      } = typeof options === 'function' ? options(state) : options;\n      if (element && isRef(element)) {\n        if (element.current != null) {\n          return (0,_floating_ui_dom__WEBPACK_IMPORTED_MODULE_0__.arrow)({\n            element: element.current,\n            padding\n          }).fn(state);\n        }\n        return {};\n      }\n      if (element) {\n        return (0,_floating_ui_dom__WEBPACK_IMPORTED_MODULE_0__.arrow)({\n          element,\n          padding\n        }).fn(state);\n      }\n      return {};\n    }\n  };\n};\n\n/**\n * Modifies the placement by translating the floating element along the\n * specified axes.\n * A number (shorthand for `mainAxis` or distance), or an axes configuration\n * object may be passed.\n * @see https://floating-ui.com/docs/offset\n */\nconst offset = (options, deps) => ({\n  ...(0,_floating_ui_dom__WEBPACK_IMPORTED_MODULE_0__.offset)(options),\n  options: [options, deps]\n});\n\n/**\n * Optimizes the visibility of the floating element by shifting it in order to\n * keep it in view when it will overflow the clipping boundary.\n * @see https://floating-ui.com/docs/shift\n */\nconst shift = (options, deps) => ({\n  ...(0,_floating_ui_dom__WEBPACK_IMPORTED_MODULE_0__.shift)(options),\n  options: [options, deps]\n});\n\n/**\n * Built-in `limiter` that will stop `shift()` at a certain point.\n */\nconst limitShift = (options, deps) => ({\n  ...(0,_floating_ui_dom__WEBPACK_IMPORTED_MODULE_0__.limitShift)(options),\n  options: [options, deps]\n});\n\n/**\n * Optimizes the visibility of the floating element by flipping the `placement`\n * in order to keep it in view when the preferred placement(s) will overflow the\n * clipping boundary. Alternative to `autoPlacement`.\n * @see https://floating-ui.com/docs/flip\n */\nconst flip = (options, deps) => ({\n  ...(0,_floating_ui_dom__WEBPACK_IMPORTED_MODULE_0__.flip)(options),\n  options: [options, deps]\n});\n\n/**\n * Provides data that allows you to change the size of the floating element —\n * for instance, prevent it from overflowing the clipping boundary or match the\n * width of the reference element.\n * @see https://floating-ui.com/docs/size\n */\nconst size = (options, deps) => ({\n  ...(0,_floating_ui_dom__WEBPACK_IMPORTED_MODULE_0__.size)(options),\n  options: [options, deps]\n});\n\n/**\n * Optimizes the visibility of the floating element by choosing the placement\n * that has the most space available automatically, without needing to specify a\n * preferred placement. Alternative to `flip`.\n * @see https://floating-ui.com/docs/autoPlacement\n */\nconst autoPlacement = (options, deps) => ({\n  ...(0,_floating_ui_dom__WEBPACK_IMPORTED_MODULE_0__.autoPlacement)(options),\n  options: [options, deps]\n});\n\n/**\n * Provides data to hide the floating element in applicable situations, such as\n * when it is not in the same clipping context as the reference element.\n * @see https://floating-ui.com/docs/hide\n */\nconst hide = (options, deps) => ({\n  ...(0,_floating_ui_dom__WEBPACK_IMPORTED_MODULE_0__.hide)(options),\n  options: [options, deps]\n});\n\n/**\n * Provides improved positioning for inline reference elements that can span\n * over multiple lines, such as hyperlinks or range selections.\n * @see https://floating-ui.com/docs/inline\n */\nconst inline = (options, deps) => ({\n  ...(0,_floating_ui_dom__WEBPACK_IMPORTED_MODULE_0__.inline)(options),\n  options: [options, deps]\n});\n\n/**\n * Provides data to position an inner element of the floating element so that it\n * appears centered to the reference element.\n * This wraps the core `arrow` middleware to allow React refs as the element.\n * @see https://floating-ui.com/docs/arrow\n */\nconst arrow = (options, deps) => ({\n  ...arrow$1(options),\n  options: [options, deps]\n});\n\n\n//# sourceURL=[module]\n//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiKHNzcikvLi9ub2RlX21vZHVsZXMvLnBucG0vQGZsb2F0aW5nLXVpK3JlYWN0LWRvbUAyLjEuMl9yZWFjdC1kb21AMTkuMC4wX3JlYWN0QDE5LjAuMF9fcmVhY3RAMTkuMC4wL25vZGVfbW9kdWxlcy9AZmxvYXRpbmctdWkvcmVhY3QtZG9tL2Rpc3QvZmxvYXRpbmctdWkucmVhY3QtZG9tLm1qcyIsIm1hcHBpbmdzIjoiOzs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7O0FBQTZPO0FBQzlIO0FBQ2hGO0FBQ29CO0FBQ2I7O0FBRXRDLDhDQUE4QyxrREFBZSxHQUFHLDRDQUFTOztBQUV6RTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBLHVCQUF1QixVQUFVO0FBQ2pDO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQSxxQkFBcUIsVUFBVTtBQUMvQixhQUFhO0FBQ2I7QUFDQTtBQUNBO0FBQ0EscUJBQXFCLFVBQVU7QUFDL0I7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBOztBQUVBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBOztBQUVBO0FBQ0E7QUFDQTtBQUNBOztBQUVBO0FBQ0EsY0FBYyx5Q0FBWTtBQUMxQjtBQUNBO0FBQ0EsR0FBRztBQUNIO0FBQ0E7O0FBRUE7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQSxNQUFNLElBQUk7QUFDVjtBQUNBO0FBQ0E7QUFDQSxJQUFJO0FBQ0osMEJBQTBCLDJDQUFjO0FBQ3hDO0FBQ0E7QUFDQTtBQUNBO0FBQ0Esc0JBQXNCO0FBQ3RCO0FBQ0EsR0FBRztBQUNILGtEQUFrRCwyQ0FBYztBQUNoRTtBQUNBO0FBQ0E7QUFDQSxzQ0FBc0MsMkNBQWM7QUFDcEQsb0NBQW9DLDJDQUFjO0FBQ2xELHVCQUF1Qiw4Q0FBaUI7QUFDeEM7QUFDQTtBQUNBO0FBQ0E7QUFDQSxHQUFHO0FBQ0gsc0JBQXNCLDhDQUFpQjtBQUN2QztBQUNBO0FBQ0E7QUFDQTtBQUNBLEdBQUc7QUFDSDtBQUNBO0FBQ0EsdUJBQXVCLHlDQUFZO0FBQ25DLHNCQUFzQix5Q0FBWTtBQUNsQyxrQkFBa0IseUNBQVk7QUFDOUI7QUFDQTtBQUNBO0FBQ0E7QUFDQSxpQkFBaUIsOENBQWlCO0FBQ2xDO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQSxJQUFJLGlFQUFlO0FBQ25CO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0EsUUFBUSxnREFBa0I7QUFDMUI7QUFDQSxTQUFTO0FBQ1Q7QUFDQSxLQUFLO0FBQ0wsR0FBRztBQUNIO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBLE9BQU87QUFDUDtBQUNBLEdBQUc7QUFDSCx1QkFBdUIseUNBQVk7QUFDbkM7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBLEdBQUc7QUFDSDtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQSxHQUFHO0FBQ0gsZUFBZSwwQ0FBYTtBQUM1QjtBQUNBO0FBQ0E7QUFDQTtBQUNBLEdBQUc7QUFDSCxtQkFBbUIsMENBQWE7QUFDaEM7QUFDQTtBQUNBLEdBQUc7QUFDSCx5QkFBeUIsMENBQWE7QUFDdEM7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQSxTQUFTO0FBQ1Q7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQSxHQUFHO0FBQ0gsU0FBUywwQ0FBYTtBQUN0QjtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0EsR0FBRztBQUNIOztBQUVBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQSxhQUFhO0FBQ2I7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBLFFBQVE7QUFDUjtBQUNBO0FBQ0EsaUJBQWlCLHVEQUFPO0FBQ3hCO0FBQ0E7QUFDQSxXQUFXO0FBQ1g7QUFDQTtBQUNBO0FBQ0E7QUFDQSxlQUFlLHVEQUFPO0FBQ3RCO0FBQ0E7QUFDQSxTQUFTO0FBQ1Q7QUFDQTtBQUNBO0FBQ0E7QUFDQTs7QUFFQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0EsS0FBSyx3REFBUTtBQUNiO0FBQ0EsQ0FBQzs7QUFFRDtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQSxLQUFLLHVEQUFPO0FBQ1o7QUFDQSxDQUFDOztBQUVEO0FBQ0E7QUFDQTtBQUNBO0FBQ0EsS0FBSyw0REFBWTtBQUNqQjtBQUNBLENBQUM7O0FBRUQ7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQSxLQUFLLHNEQUFNO0FBQ1g7QUFDQSxDQUFDOztBQUVEO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0EsS0FBSyxzREFBTTtBQUNYO0FBQ0EsQ0FBQzs7QUFFRDtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBLEtBQUssK0RBQWU7QUFDcEI7QUFDQSxDQUFDOztBQUVEO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBLEtBQUssc0RBQU07QUFDWDtBQUNBLENBQUM7O0FBRUQ7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0EsS0FBSyx3REFBUTtBQUNiO0FBQ0EsQ0FBQzs7QUFFRDtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQSxDQUFDOztBQUVpRyIsInNvdXJjZXMiOlsiL1VzZXJzL2FkdmFpdC5iaXRrYXJ0aGlyZHdhdmVjb2ZmZWUuaW4vRG9jdW1lbnRzL3R3Y193b3JrL2hlbGl1bV9mbHV0dGVyX3ZhbGlkYXRvci9kb2NzL25vZGVfbW9kdWxlcy8ucG5wbS9AZmxvYXRpbmctdWkrcmVhY3QtZG9tQDIuMS4yX3JlYWN0LWRvbUAxOS4wLjBfcmVhY3RAMTkuMC4wX19yZWFjdEAxOS4wLjAvbm9kZV9tb2R1bGVzL0BmbG9hdGluZy11aS9yZWFjdC1kb20vZGlzdC9mbG9hdGluZy11aS5yZWFjdC1kb20ubWpzIl0sInNvdXJjZXNDb250ZW50IjpbImltcG9ydCB7IGNvbXB1dGVQb3NpdGlvbiwgYXJyb3cgYXMgYXJyb3ckMiwgb2Zmc2V0IGFzIG9mZnNldCQxLCBzaGlmdCBhcyBzaGlmdCQxLCBsaW1pdFNoaWZ0IGFzIGxpbWl0U2hpZnQkMSwgZmxpcCBhcyBmbGlwJDEsIHNpemUgYXMgc2l6ZSQxLCBhdXRvUGxhY2VtZW50IGFzIGF1dG9QbGFjZW1lbnQkMSwgaGlkZSBhcyBoaWRlJDEsIGlubGluZSBhcyBpbmxpbmUkMSB9IGZyb20gJ0BmbG9hdGluZy11aS9kb20nO1xuZXhwb3J0IHsgYXV0b1VwZGF0ZSwgY29tcHV0ZVBvc2l0aW9uLCBkZXRlY3RPdmVyZmxvdywgZ2V0T3ZlcmZsb3dBbmNlc3RvcnMsIHBsYXRmb3JtIH0gZnJvbSAnQGZsb2F0aW5nLXVpL2RvbSc7XG5pbXBvcnQgKiBhcyBSZWFjdCBmcm9tICdyZWFjdCc7XG5pbXBvcnQgeyB1c2VMYXlvdXRFZmZlY3QsIHVzZUVmZmVjdCB9IGZyb20gJ3JlYWN0JztcbmltcG9ydCAqIGFzIFJlYWN0RE9NIGZyb20gJ3JlYWN0LWRvbSc7XG5cbnZhciBpbmRleCA9IHR5cGVvZiBkb2N1bWVudCAhPT0gJ3VuZGVmaW5lZCcgPyB1c2VMYXlvdXRFZmZlY3QgOiB1c2VFZmZlY3Q7XG5cbi8vIEZvcmsgb2YgYGZhc3QtZGVlcC1lcXVhbGAgdGhhdCBvbmx5IGRvZXMgdGhlIGNvbXBhcmlzb25zIHdlIG5lZWQgYW5kIGNvbXBhcmVzXG4vLyBmdW5jdGlvbnNcbmZ1bmN0aW9uIGRlZXBFcXVhbChhLCBiKSB7XG4gIGlmIChhID09PSBiKSB7XG4gICAgcmV0dXJuIHRydWU7XG4gIH1cbiAgaWYgKHR5cGVvZiBhICE9PSB0eXBlb2YgYikge1xuICAgIHJldHVybiBmYWxzZTtcbiAgfVxuICBpZiAodHlwZW9mIGEgPT09ICdmdW5jdGlvbicgJiYgYS50b1N0cmluZygpID09PSBiLnRvU3RyaW5nKCkpIHtcbiAgICByZXR1cm4gdHJ1ZTtcbiAgfVxuICBsZXQgbGVuZ3RoO1xuICBsZXQgaTtcbiAgbGV0IGtleXM7XG4gIGlmIChhICYmIGIgJiYgdHlwZW9mIGEgPT09ICdvYmplY3QnKSB7XG4gICAgaWYgKEFycmF5LmlzQXJyYXkoYSkpIHtcbiAgICAgIGxlbmd0aCA9IGEubGVuZ3RoO1xuICAgICAgaWYgKGxlbmd0aCAhPT0gYi5sZW5ndGgpIHJldHVybiBmYWxzZTtcbiAgICAgIGZvciAoaSA9IGxlbmd0aDsgaS0tICE9PSAwOykge1xuICAgICAgICBpZiAoIWRlZXBFcXVhbChhW2ldLCBiW2ldKSkge1xuICAgICAgICAgIHJldHVybiBmYWxzZTtcbiAgICAgICAgfVxuICAgICAgfVxuICAgICAgcmV0dXJuIHRydWU7XG4gICAgfVxuICAgIGtleXMgPSBPYmplY3Qua2V5cyhhKTtcbiAgICBsZW5ndGggPSBrZXlzLmxlbmd0aDtcbiAgICBpZiAobGVuZ3RoICE9PSBPYmplY3Qua2V5cyhiKS5sZW5ndGgpIHtcbiAgICAgIHJldHVybiBmYWxzZTtcbiAgICB9XG4gICAgZm9yIChpID0gbGVuZ3RoOyBpLS0gIT09IDA7KSB7XG4gICAgICBpZiAoIXt9Lmhhc093blByb3BlcnR5LmNhbGwoYiwga2V5c1tpXSkpIHtcbiAgICAgICAgcmV0dXJuIGZhbHNlO1xuICAgICAgfVxuICAgIH1cbiAgICBmb3IgKGkgPSBsZW5ndGg7IGktLSAhPT0gMDspIHtcbiAgICAgIGNvbnN0IGtleSA9IGtleXNbaV07XG4gICAgICBpZiAoa2V5ID09PSAnX293bmVyJyAmJiBhLiQkdHlwZW9mKSB7XG4gICAgICAgIGNvbnRpbnVlO1xuICAgICAgfVxuICAgICAgaWYgKCFkZWVwRXF1YWwoYVtrZXldLCBiW2tleV0pKSB7XG4gICAgICAgIHJldHVybiBmYWxzZTtcbiAgICAgIH1cbiAgICB9XG4gICAgcmV0dXJuIHRydWU7XG4gIH1cbiAgcmV0dXJuIGEgIT09IGEgJiYgYiAhPT0gYjtcbn1cblxuZnVuY3Rpb24gZ2V0RFBSKGVsZW1lbnQpIHtcbiAgaWYgKHR5cGVvZiB3aW5kb3cgPT09ICd1bmRlZmluZWQnKSB7XG4gICAgcmV0dXJuIDE7XG4gIH1cbiAgY29uc3Qgd2luID0gZWxlbWVudC5vd25lckRvY3VtZW50LmRlZmF1bHRWaWV3IHx8IHdpbmRvdztcbiAgcmV0dXJuIHdpbi5kZXZpY2VQaXhlbFJhdGlvIHx8IDE7XG59XG5cbmZ1bmN0aW9uIHJvdW5kQnlEUFIoZWxlbWVudCwgdmFsdWUpIHtcbiAgY29uc3QgZHByID0gZ2V0RFBSKGVsZW1lbnQpO1xuICByZXR1cm4gTWF0aC5yb3VuZCh2YWx1ZSAqIGRwcikgLyBkcHI7XG59XG5cbmZ1bmN0aW9uIHVzZUxhdGVzdFJlZih2YWx1ZSkge1xuICBjb25zdCByZWYgPSBSZWFjdC51c2VSZWYodmFsdWUpO1xuICBpbmRleCgoKSA9PiB7XG4gICAgcmVmLmN1cnJlbnQgPSB2YWx1ZTtcbiAgfSk7XG4gIHJldHVybiByZWY7XG59XG5cbi8qKlxuICogUHJvdmlkZXMgZGF0YSB0byBwb3NpdGlvbiBhIGZsb2F0aW5nIGVsZW1lbnQuXG4gKiBAc2VlIGh0dHBzOi8vZmxvYXRpbmctdWkuY29tL2RvY3MvdXNlRmxvYXRpbmdcbiAqL1xuZnVuY3Rpb24gdXNlRmxvYXRpbmcob3B0aW9ucykge1xuICBpZiAob3B0aW9ucyA9PT0gdm9pZCAwKSB7XG4gICAgb3B0aW9ucyA9IHt9O1xuICB9XG4gIGNvbnN0IHtcbiAgICBwbGFjZW1lbnQgPSAnYm90dG9tJyxcbiAgICBzdHJhdGVneSA9ICdhYnNvbHV0ZScsXG4gICAgbWlkZGxld2FyZSA9IFtdLFxuICAgIHBsYXRmb3JtLFxuICAgIGVsZW1lbnRzOiB7XG4gICAgICByZWZlcmVuY2U6IGV4dGVybmFsUmVmZXJlbmNlLFxuICAgICAgZmxvYXRpbmc6IGV4dGVybmFsRmxvYXRpbmdcbiAgICB9ID0ge30sXG4gICAgdHJhbnNmb3JtID0gdHJ1ZSxcbiAgICB3aGlsZUVsZW1lbnRzTW91bnRlZCxcbiAgICBvcGVuXG4gIH0gPSBvcHRpb25zO1xuICBjb25zdCBbZGF0YSwgc2V0RGF0YV0gPSBSZWFjdC51c2VTdGF0ZSh7XG4gICAgeDogMCxcbiAgICB5OiAwLFxuICAgIHN0cmF0ZWd5LFxuICAgIHBsYWNlbWVudCxcbiAgICBtaWRkbGV3YXJlRGF0YToge30sXG4gICAgaXNQb3NpdGlvbmVkOiBmYWxzZVxuICB9KTtcbiAgY29uc3QgW2xhdGVzdE1pZGRsZXdhcmUsIHNldExhdGVzdE1pZGRsZXdhcmVdID0gUmVhY3QudXNlU3RhdGUobWlkZGxld2FyZSk7XG4gIGlmICghZGVlcEVxdWFsKGxhdGVzdE1pZGRsZXdhcmUsIG1pZGRsZXdhcmUpKSB7XG4gICAgc2V0TGF0ZXN0TWlkZGxld2FyZShtaWRkbGV3YXJlKTtcbiAgfVxuICBjb25zdCBbX3JlZmVyZW5jZSwgX3NldFJlZmVyZW5jZV0gPSBSZWFjdC51c2VTdGF0ZShudWxsKTtcbiAgY29uc3QgW19mbG9hdGluZywgX3NldEZsb2F0aW5nXSA9IFJlYWN0LnVzZVN0YXRlKG51bGwpO1xuICBjb25zdCBzZXRSZWZlcmVuY2UgPSBSZWFjdC51c2VDYWxsYmFjayhub2RlID0+IHtcbiAgICBpZiAobm9kZSAhPT0gcmVmZXJlbmNlUmVmLmN1cnJlbnQpIHtcbiAgICAgIHJlZmVyZW5jZVJlZi5jdXJyZW50ID0gbm9kZTtcbiAgICAgIF9zZXRSZWZlcmVuY2Uobm9kZSk7XG4gICAgfVxuICB9LCBbXSk7XG4gIGNvbnN0IHNldEZsb2F0aW5nID0gUmVhY3QudXNlQ2FsbGJhY2sobm9kZSA9PiB7XG4gICAgaWYgKG5vZGUgIT09IGZsb2F0aW5nUmVmLmN1cnJlbnQpIHtcbiAgICAgIGZsb2F0aW5nUmVmLmN1cnJlbnQgPSBub2RlO1xuICAgICAgX3NldEZsb2F0aW5nKG5vZGUpO1xuICAgIH1cbiAgfSwgW10pO1xuICBjb25zdCByZWZlcmVuY2VFbCA9IGV4dGVybmFsUmVmZXJlbmNlIHx8IF9yZWZlcmVuY2U7XG4gIGNvbnN0IGZsb2F0aW5nRWwgPSBleHRlcm5hbEZsb2F0aW5nIHx8IF9mbG9hdGluZztcbiAgY29uc3QgcmVmZXJlbmNlUmVmID0gUmVhY3QudXNlUmVmKG51bGwpO1xuICBjb25zdCBmbG9hdGluZ1JlZiA9IFJlYWN0LnVzZVJlZihudWxsKTtcbiAgY29uc3QgZGF0YVJlZiA9IFJlYWN0LnVzZVJlZihkYXRhKTtcbiAgY29uc3QgaGFzV2hpbGVFbGVtZW50c01vdW50ZWQgPSB3aGlsZUVsZW1lbnRzTW91bnRlZCAhPSBudWxsO1xuICBjb25zdCB3aGlsZUVsZW1lbnRzTW91bnRlZFJlZiA9IHVzZUxhdGVzdFJlZih3aGlsZUVsZW1lbnRzTW91bnRlZCk7XG4gIGNvbnN0IHBsYXRmb3JtUmVmID0gdXNlTGF0ZXN0UmVmKHBsYXRmb3JtKTtcbiAgY29uc3Qgb3BlblJlZiA9IHVzZUxhdGVzdFJlZihvcGVuKTtcbiAgY29uc3QgdXBkYXRlID0gUmVhY3QudXNlQ2FsbGJhY2soKCkgPT4ge1xuICAgIGlmICghcmVmZXJlbmNlUmVmLmN1cnJlbnQgfHwgIWZsb2F0aW5nUmVmLmN1cnJlbnQpIHtcbiAgICAgIHJldHVybjtcbiAgICB9XG4gICAgY29uc3QgY29uZmlnID0ge1xuICAgICAgcGxhY2VtZW50LFxuICAgICAgc3RyYXRlZ3ksXG4gICAgICBtaWRkbGV3YXJlOiBsYXRlc3RNaWRkbGV3YXJlXG4gICAgfTtcbiAgICBpZiAocGxhdGZvcm1SZWYuY3VycmVudCkge1xuICAgICAgY29uZmlnLnBsYXRmb3JtID0gcGxhdGZvcm1SZWYuY3VycmVudDtcbiAgICB9XG4gICAgY29tcHV0ZVBvc2l0aW9uKHJlZmVyZW5jZVJlZi5jdXJyZW50LCBmbG9hdGluZ1JlZi5jdXJyZW50LCBjb25maWcpLnRoZW4oZGF0YSA9PiB7XG4gICAgICBjb25zdCBmdWxsRGF0YSA9IHtcbiAgICAgICAgLi4uZGF0YSxcbiAgICAgICAgLy8gVGhlIGZsb2F0aW5nIGVsZW1lbnQncyBwb3NpdGlvbiBtYXkgYmUgcmVjb21wdXRlZCB3aGlsZSBpdCdzIGNsb3NlZFxuICAgICAgICAvLyBidXQgc3RpbGwgbW91bnRlZCAoc3VjaCBhcyB3aGVuIHRyYW5zaXRpb25pbmcgb3V0KS4gVG8gZW5zdXJlXG4gICAgICAgIC8vIGBpc1Bvc2l0aW9uZWRgIHdpbGwgYmUgYGZhbHNlYCBpbml0aWFsbHkgb24gdGhlIG5leHQgb3BlbiwgYXZvaWRcbiAgICAgICAgLy8gc2V0dGluZyBpdCB0byBgdHJ1ZWAgd2hlbiBgb3BlbiA9PT0gZmFsc2VgIChtdXN0IGJlIHNwZWNpZmllZCkuXG4gICAgICAgIGlzUG9zaXRpb25lZDogb3BlblJlZi5jdXJyZW50ICE9PSBmYWxzZVxuICAgICAgfTtcbiAgICAgIGlmIChpc01vdW50ZWRSZWYuY3VycmVudCAmJiAhZGVlcEVxdWFsKGRhdGFSZWYuY3VycmVudCwgZnVsbERhdGEpKSB7XG4gICAgICAgIGRhdGFSZWYuY3VycmVudCA9IGZ1bGxEYXRhO1xuICAgICAgICBSZWFjdERPTS5mbHVzaFN5bmMoKCkgPT4ge1xuICAgICAgICAgIHNldERhdGEoZnVsbERhdGEpO1xuICAgICAgICB9KTtcbiAgICAgIH1cbiAgICB9KTtcbiAgfSwgW2xhdGVzdE1pZGRsZXdhcmUsIHBsYWNlbWVudCwgc3RyYXRlZ3ksIHBsYXRmb3JtUmVmLCBvcGVuUmVmXSk7XG4gIGluZGV4KCgpID0+IHtcbiAgICBpZiAob3BlbiA9PT0gZmFsc2UgJiYgZGF0YVJlZi5jdXJyZW50LmlzUG9zaXRpb25lZCkge1xuICAgICAgZGF0YVJlZi5jdXJyZW50LmlzUG9zaXRpb25lZCA9IGZhbHNlO1xuICAgICAgc2V0RGF0YShkYXRhID0+ICh7XG4gICAgICAgIC4uLmRhdGEsXG4gICAgICAgIGlzUG9zaXRpb25lZDogZmFsc2VcbiAgICAgIH0pKTtcbiAgICB9XG4gIH0sIFtvcGVuXSk7XG4gIGNvbnN0IGlzTW91bnRlZFJlZiA9IFJlYWN0LnVzZVJlZihmYWxzZSk7XG4gIGluZGV4KCgpID0+IHtcbiAgICBpc01vdW50ZWRSZWYuY3VycmVudCA9IHRydWU7XG4gICAgcmV0dXJuICgpID0+IHtcbiAgICAgIGlzTW91bnRlZFJlZi5jdXJyZW50ID0gZmFsc2U7XG4gICAgfTtcbiAgfSwgW10pO1xuICBpbmRleCgoKSA9PiB7XG4gICAgaWYgKHJlZmVyZW5jZUVsKSByZWZlcmVuY2VSZWYuY3VycmVudCA9IHJlZmVyZW5jZUVsO1xuICAgIGlmIChmbG9hdGluZ0VsKSBmbG9hdGluZ1JlZi5jdXJyZW50ID0gZmxvYXRpbmdFbDtcbiAgICBpZiAocmVmZXJlbmNlRWwgJiYgZmxvYXRpbmdFbCkge1xuICAgICAgaWYgKHdoaWxlRWxlbWVudHNNb3VudGVkUmVmLmN1cnJlbnQpIHtcbiAgICAgICAgcmV0dXJuIHdoaWxlRWxlbWVudHNNb3VudGVkUmVmLmN1cnJlbnQocmVmZXJlbmNlRWwsIGZsb2F0aW5nRWwsIHVwZGF0ZSk7XG4gICAgICB9XG4gICAgICB1cGRhdGUoKTtcbiAgICB9XG4gIH0sIFtyZWZlcmVuY2VFbCwgZmxvYXRpbmdFbCwgdXBkYXRlLCB3aGlsZUVsZW1lbnRzTW91bnRlZFJlZiwgaGFzV2hpbGVFbGVtZW50c01vdW50ZWRdKTtcbiAgY29uc3QgcmVmcyA9IFJlYWN0LnVzZU1lbW8oKCkgPT4gKHtcbiAgICByZWZlcmVuY2U6IHJlZmVyZW5jZVJlZixcbiAgICBmbG9hdGluZzogZmxvYXRpbmdSZWYsXG4gICAgc2V0UmVmZXJlbmNlLFxuICAgIHNldEZsb2F0aW5nXG4gIH0pLCBbc2V0UmVmZXJlbmNlLCBzZXRGbG9hdGluZ10pO1xuICBjb25zdCBlbGVtZW50cyA9IFJlYWN0LnVzZU1lbW8oKCkgPT4gKHtcbiAgICByZWZlcmVuY2U6IHJlZmVyZW5jZUVsLFxuICAgIGZsb2F0aW5nOiBmbG9hdGluZ0VsXG4gIH0pLCBbcmVmZXJlbmNlRWwsIGZsb2F0aW5nRWxdKTtcbiAgY29uc3QgZmxvYXRpbmdTdHlsZXMgPSBSZWFjdC51c2VNZW1vKCgpID0+IHtcbiAgICBjb25zdCBpbml0aWFsU3R5bGVzID0ge1xuICAgICAgcG9zaXRpb246IHN0cmF0ZWd5LFxuICAgICAgbGVmdDogMCxcbiAgICAgIHRvcDogMFxuICAgIH07XG4gICAgaWYgKCFlbGVtZW50cy5mbG9hdGluZykge1xuICAgICAgcmV0dXJuIGluaXRpYWxTdHlsZXM7XG4gICAgfVxuICAgIGNvbnN0IHggPSByb3VuZEJ5RFBSKGVsZW1lbnRzLmZsb2F0aW5nLCBkYXRhLngpO1xuICAgIGNvbnN0IHkgPSByb3VuZEJ5RFBSKGVsZW1lbnRzLmZsb2F0aW5nLCBkYXRhLnkpO1xuICAgIGlmICh0cmFuc2Zvcm0pIHtcbiAgICAgIHJldHVybiB7XG4gICAgICAgIC4uLmluaXRpYWxTdHlsZXMsXG4gICAgICAgIHRyYW5zZm9ybTogXCJ0cmFuc2xhdGUoXCIgKyB4ICsgXCJweCwgXCIgKyB5ICsgXCJweClcIixcbiAgICAgICAgLi4uKGdldERQUihlbGVtZW50cy5mbG9hdGluZykgPj0gMS41ICYmIHtcbiAgICAgICAgICB3aWxsQ2hhbmdlOiAndHJhbnNmb3JtJ1xuICAgICAgICB9KVxuICAgICAgfTtcbiAgICB9XG4gICAgcmV0dXJuIHtcbiAgICAgIHBvc2l0aW9uOiBzdHJhdGVneSxcbiAgICAgIGxlZnQ6IHgsXG4gICAgICB0b3A6IHlcbiAgICB9O1xuICB9LCBbc3RyYXRlZ3ksIHRyYW5zZm9ybSwgZWxlbWVudHMuZmxvYXRpbmcsIGRhdGEueCwgZGF0YS55XSk7XG4gIHJldHVybiBSZWFjdC51c2VNZW1vKCgpID0+ICh7XG4gICAgLi4uZGF0YSxcbiAgICB1cGRhdGUsXG4gICAgcmVmcyxcbiAgICBlbGVtZW50cyxcbiAgICBmbG9hdGluZ1N0eWxlc1xuICB9KSwgW2RhdGEsIHVwZGF0ZSwgcmVmcywgZWxlbWVudHMsIGZsb2F0aW5nU3R5bGVzXSk7XG59XG5cbi8qKlxuICogUHJvdmlkZXMgZGF0YSB0byBwb3NpdGlvbiBhbiBpbm5lciBlbGVtZW50IG9mIHRoZSBmbG9hdGluZyBlbGVtZW50IHNvIHRoYXQgaXRcbiAqIGFwcGVhcnMgY2VudGVyZWQgdG8gdGhlIHJlZmVyZW5jZSBlbGVtZW50LlxuICogVGhpcyB3cmFwcyB0aGUgY29yZSBgYXJyb3dgIG1pZGRsZXdhcmUgdG8gYWxsb3cgUmVhY3QgcmVmcyBhcyB0aGUgZWxlbWVudC5cbiAqIEBzZWUgaHR0cHM6Ly9mbG9hdGluZy11aS5jb20vZG9jcy9hcnJvd1xuICovXG5jb25zdCBhcnJvdyQxID0gb3B0aW9ucyA9PiB7XG4gIGZ1bmN0aW9uIGlzUmVmKHZhbHVlKSB7XG4gICAgcmV0dXJuIHt9Lmhhc093blByb3BlcnR5LmNhbGwodmFsdWUsICdjdXJyZW50Jyk7XG4gIH1cbiAgcmV0dXJuIHtcbiAgICBuYW1lOiAnYXJyb3cnLFxuICAgIG9wdGlvbnMsXG4gICAgZm4oc3RhdGUpIHtcbiAgICAgIGNvbnN0IHtcbiAgICAgICAgZWxlbWVudCxcbiAgICAgICAgcGFkZGluZ1xuICAgICAgfSA9IHR5cGVvZiBvcHRpb25zID09PSAnZnVuY3Rpb24nID8gb3B0aW9ucyhzdGF0ZSkgOiBvcHRpb25zO1xuICAgICAgaWYgKGVsZW1lbnQgJiYgaXNSZWYoZWxlbWVudCkpIHtcbiAgICAgICAgaWYgKGVsZW1lbnQuY3VycmVudCAhPSBudWxsKSB7XG4gICAgICAgICAgcmV0dXJuIGFycm93JDIoe1xuICAgICAgICAgICAgZWxlbWVudDogZWxlbWVudC5jdXJyZW50LFxuICAgICAgICAgICAgcGFkZGluZ1xuICAgICAgICAgIH0pLmZuKHN0YXRlKTtcbiAgICAgICAgfVxuICAgICAgICByZXR1cm4ge307XG4gICAgICB9XG4gICAgICBpZiAoZWxlbWVudCkge1xuICAgICAgICByZXR1cm4gYXJyb3ckMih7XG4gICAgICAgICAgZWxlbWVudCxcbiAgICAgICAgICBwYWRkaW5nXG4gICAgICAgIH0pLmZuKHN0YXRlKTtcbiAgICAgIH1cbiAgICAgIHJldHVybiB7fTtcbiAgICB9XG4gIH07XG59O1xuXG4vKipcbiAqIE1vZGlmaWVzIHRoZSBwbGFjZW1lbnQgYnkgdHJhbnNsYXRpbmcgdGhlIGZsb2F0aW5nIGVsZW1lbnQgYWxvbmcgdGhlXG4gKiBzcGVjaWZpZWQgYXhlcy5cbiAqIEEgbnVtYmVyIChzaG9ydGhhbmQgZm9yIGBtYWluQXhpc2Agb3IgZGlzdGFuY2UpLCBvciBhbiBheGVzIGNvbmZpZ3VyYXRpb25cbiAqIG9iamVjdCBtYXkgYmUgcGFzc2VkLlxuICogQHNlZSBodHRwczovL2Zsb2F0aW5nLXVpLmNvbS9kb2NzL29mZnNldFxuICovXG5jb25zdCBvZmZzZXQgPSAob3B0aW9ucywgZGVwcykgPT4gKHtcbiAgLi4ub2Zmc2V0JDEob3B0aW9ucyksXG4gIG9wdGlvbnM6IFtvcHRpb25zLCBkZXBzXVxufSk7XG5cbi8qKlxuICogT3B0aW1pemVzIHRoZSB2aXNpYmlsaXR5IG9mIHRoZSBmbG9hdGluZyBlbGVtZW50IGJ5IHNoaWZ0aW5nIGl0IGluIG9yZGVyIHRvXG4gKiBrZWVwIGl0IGluIHZpZXcgd2hlbiBpdCB3aWxsIG92ZXJmbG93IHRoZSBjbGlwcGluZyBib3VuZGFyeS5cbiAqIEBzZWUgaHR0cHM6Ly9mbG9hdGluZy11aS5jb20vZG9jcy9zaGlmdFxuICovXG5jb25zdCBzaGlmdCA9IChvcHRpb25zLCBkZXBzKSA9PiAoe1xuICAuLi5zaGlmdCQxKG9wdGlvbnMpLFxuICBvcHRpb25zOiBbb3B0aW9ucywgZGVwc11cbn0pO1xuXG4vKipcbiAqIEJ1aWx0LWluIGBsaW1pdGVyYCB0aGF0IHdpbGwgc3RvcCBgc2hpZnQoKWAgYXQgYSBjZXJ0YWluIHBvaW50LlxuICovXG5jb25zdCBsaW1pdFNoaWZ0ID0gKG9wdGlvbnMsIGRlcHMpID0+ICh7XG4gIC4uLmxpbWl0U2hpZnQkMShvcHRpb25zKSxcbiAgb3B0aW9uczogW29wdGlvbnMsIGRlcHNdXG59KTtcblxuLyoqXG4gKiBPcHRpbWl6ZXMgdGhlIHZpc2liaWxpdHkgb2YgdGhlIGZsb2F0aW5nIGVsZW1lbnQgYnkgZmxpcHBpbmcgdGhlIGBwbGFjZW1lbnRgXG4gKiBpbiBvcmRlciB0byBrZWVwIGl0IGluIHZpZXcgd2hlbiB0aGUgcHJlZmVycmVkIHBsYWNlbWVudChzKSB3aWxsIG92ZXJmbG93IHRoZVxuICogY2xpcHBpbmcgYm91bmRhcnkuIEFsdGVybmF0aXZlIHRvIGBhdXRvUGxhY2VtZW50YC5cbiAqIEBzZWUgaHR0cHM6Ly9mbG9hdGluZy11aS5jb20vZG9jcy9mbGlwXG4gKi9cbmNvbnN0IGZsaXAgPSAob3B0aW9ucywgZGVwcykgPT4gKHtcbiAgLi4uZmxpcCQxKG9wdGlvbnMpLFxuICBvcHRpb25zOiBbb3B0aW9ucywgZGVwc11cbn0pO1xuXG4vKipcbiAqIFByb3ZpZGVzIGRhdGEgdGhhdCBhbGxvd3MgeW91IHRvIGNoYW5nZSB0aGUgc2l6ZSBvZiB0aGUgZmxvYXRpbmcgZWxlbWVudCDigJRcbiAqIGZvciBpbnN0YW5jZSwgcHJldmVudCBpdCBmcm9tIG92ZXJmbG93aW5nIHRoZSBjbGlwcGluZyBib3VuZGFyeSBvciBtYXRjaCB0aGVcbiAqIHdpZHRoIG9mIHRoZSByZWZlcmVuY2UgZWxlbWVudC5cbiAqIEBzZWUgaHR0cHM6Ly9mbG9hdGluZy11aS5jb20vZG9jcy9zaXplXG4gKi9cbmNvbnN0IHNpemUgPSAob3B0aW9ucywgZGVwcykgPT4gKHtcbiAgLi4uc2l6ZSQxKG9wdGlvbnMpLFxuICBvcHRpb25zOiBbb3B0aW9ucywgZGVwc11cbn0pO1xuXG4vKipcbiAqIE9wdGltaXplcyB0aGUgdmlzaWJpbGl0eSBvZiB0aGUgZmxvYXRpbmcgZWxlbWVudCBieSBjaG9vc2luZyB0aGUgcGxhY2VtZW50XG4gKiB0aGF0IGhhcyB0aGUgbW9zdCBzcGFjZSBhdmFpbGFibGUgYXV0b21hdGljYWxseSwgd2l0aG91dCBuZWVkaW5nIHRvIHNwZWNpZnkgYVxuICogcHJlZmVycmVkIHBsYWNlbWVudC4gQWx0ZXJuYXRpdmUgdG8gYGZsaXBgLlxuICogQHNlZSBodHRwczovL2Zsb2F0aW5nLXVpLmNvbS9kb2NzL2F1dG9QbGFjZW1lbnRcbiAqL1xuY29uc3QgYXV0b1BsYWNlbWVudCA9IChvcHRpb25zLCBkZXBzKSA9PiAoe1xuICAuLi5hdXRvUGxhY2VtZW50JDEob3B0aW9ucyksXG4gIG9wdGlvbnM6IFtvcHRpb25zLCBkZXBzXVxufSk7XG5cbi8qKlxuICogUHJvdmlkZXMgZGF0YSB0byBoaWRlIHRoZSBmbG9hdGluZyBlbGVtZW50IGluIGFwcGxpY2FibGUgc2l0dWF0aW9ucywgc3VjaCBhc1xuICogd2hlbiBpdCBpcyBub3QgaW4gdGhlIHNhbWUgY2xpcHBpbmcgY29udGV4dCBhcyB0aGUgcmVmZXJlbmNlIGVsZW1lbnQuXG4gKiBAc2VlIGh0dHBzOi8vZmxvYXRpbmctdWkuY29tL2RvY3MvaGlkZVxuICovXG5jb25zdCBoaWRlID0gKG9wdGlvbnMsIGRlcHMpID0+ICh7XG4gIC4uLmhpZGUkMShvcHRpb25zKSxcbiAgb3B0aW9uczogW29wdGlvbnMsIGRlcHNdXG59KTtcblxuLyoqXG4gKiBQcm92aWRlcyBpbXByb3ZlZCBwb3NpdGlvbmluZyBmb3IgaW5saW5lIHJlZmVyZW5jZSBlbGVtZW50cyB0aGF0IGNhbiBzcGFuXG4gKiBvdmVyIG11bHRpcGxlIGxpbmVzLCBzdWNoIGFzIGh5cGVybGlua3Mgb3IgcmFuZ2Ugc2VsZWN0aW9ucy5cbiAqIEBzZWUgaHR0cHM6Ly9mbG9hdGluZy11aS5jb20vZG9jcy9pbmxpbmVcbiAqL1xuY29uc3QgaW5saW5lID0gKG9wdGlvbnMsIGRlcHMpID0+ICh7XG4gIC4uLmlubGluZSQxKG9wdGlvbnMpLFxuICBvcHRpb25zOiBbb3B0aW9ucywgZGVwc11cbn0pO1xuXG4vKipcbiAqIFByb3ZpZGVzIGRhdGEgdG8gcG9zaXRpb24gYW4gaW5uZXIgZWxlbWVudCBvZiB0aGUgZmxvYXRpbmcgZWxlbWVudCBzbyB0aGF0IGl0XG4gKiBhcHBlYXJzIGNlbnRlcmVkIHRvIHRoZSByZWZlcmVuY2UgZWxlbWVudC5cbiAqIFRoaXMgd3JhcHMgdGhlIGNvcmUgYGFycm93YCBtaWRkbGV3YXJlIHRvIGFsbG93IFJlYWN0IHJlZnMgYXMgdGhlIGVsZW1lbnQuXG4gKiBAc2VlIGh0dHBzOi8vZmxvYXRpbmctdWkuY29tL2RvY3MvYXJyb3dcbiAqL1xuY29uc3QgYXJyb3cgPSAob3B0aW9ucywgZGVwcykgPT4gKHtcbiAgLi4uYXJyb3ckMShvcHRpb25zKSxcbiAgb3B0aW9uczogW29wdGlvbnMsIGRlcHNdXG59KTtcblxuZXhwb3J0IHsgYXJyb3csIGF1dG9QbGFjZW1lbnQsIGZsaXAsIGhpZGUsIGlubGluZSwgbGltaXRTaGlmdCwgb2Zmc2V0LCBzaGlmdCwgc2l6ZSwgdXNlRmxvYXRpbmcgfTtcbiJdLCJuYW1lcyI6W10sImlnbm9yZUxpc3QiOlswXSwic291cmNlUm9vdCI6IiJ9\n//# sourceURL=webpack-internal:///(ssr)/./node_modules/.pnpm/@floating-ui+react-dom@2.1.2_react-dom@19.0.0_react@19.0.0__react@19.0.0/node_modules/@floating-ui/react-dom/dist/floating-ui.react-dom.mjs\n");

/***/ })

};
;