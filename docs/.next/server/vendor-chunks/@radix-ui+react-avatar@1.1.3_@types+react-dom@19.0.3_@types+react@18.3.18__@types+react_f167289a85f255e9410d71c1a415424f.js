"use strict";
/*
 * ATTENTION: An "eval-source-map" devtool has been used.
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file with attached SourceMaps in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
exports.id = "vendor-chunks/@radix-ui+react-avatar@1.1.3_@types+react-dom@19.0.3_@types+react@18.3.18__@types+react_f167289a85f255e9410d71c1a415424f";
exports.ids = ["vendor-chunks/@radix-ui+react-avatar@1.1.3_@types+react-dom@19.0.3_@types+react@18.3.18__@types+react_f167289a85f255e9410d71c1a415424f"];
exports.modules = {

/***/ "(ssr)/./node_modules/.pnpm/@radix-ui+react-avatar@1.1.3_@types+react-dom@19.0.3_@types+react@18.3.18__@types+react_f167289a85f255e9410d71c1a415424f/node_modules/@radix-ui/react-avatar/dist/index.mjs":
/*!********************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/.pnpm/@radix-ui+react-avatar@1.1.3_@types+react-dom@19.0.3_@types+react@18.3.18__@types+react_f167289a85f255e9410d71c1a415424f/node_modules/@radix-ui/react-avatar/dist/index.mjs ***!
  \********************************************************************************************************************************************************************************************************/
/***/ ((__unused_webpack___webpack_module__, __webpack_exports__, __webpack_require__) => {

eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export */ __webpack_require__.d(__webpack_exports__, {\n/* harmony export */   Avatar: () => (/* binding */ Avatar),\n/* harmony export */   AvatarFallback: () => (/* binding */ AvatarFallback),\n/* harmony export */   AvatarImage: () => (/* binding */ AvatarImage),\n/* harmony export */   Fallback: () => (/* binding */ Fallback),\n/* harmony export */   Image: () => (/* binding */ Image),\n/* harmony export */   Root: () => (/* binding */ Root),\n/* harmony export */   createAvatarScope: () => (/* binding */ createAvatarScope)\n/* harmony export */ });\n/* harmony import */ var react__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! react */ \"(ssr)/./node_modules/.pnpm/next@15.0.4_react-dom@19.0.0_react@19.0.0__react@19.0.0/node_modules/next/dist/server/route-modules/app-page/vendored/ssr/react.js\");\n/* harmony import */ var _radix_ui_react_context__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! @radix-ui/react-context */ \"(ssr)/./node_modules/.pnpm/@radix-ui+react-context@1.1.1_@types+react@18.3.18_react@19.0.0/node_modules/@radix-ui/react-context/dist/index.mjs\");\n/* harmony import */ var _radix_ui_react_use_callback_ref__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(/*! @radix-ui/react-use-callback-ref */ \"(ssr)/./node_modules/.pnpm/@radix-ui+react-use-callback-ref@1.1.0_@types+react@18.3.18_react@19.0.0/node_modules/@radix-ui/react-use-callback-ref/dist/index.mjs\");\n/* harmony import */ var _radix_ui_react_use_layout_effect__WEBPACK_IMPORTED_MODULE_5__ = __webpack_require__(/*! @radix-ui/react-use-layout-effect */ \"(ssr)/./node_modules/.pnpm/@radix-ui+react-use-layout-effect@1.1.0_@types+react@18.3.18_react@19.0.0/node_modules/@radix-ui/react-use-layout-effect/dist/index.mjs\");\n/* harmony import */ var _radix_ui_react_primitive__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! @radix-ui/react-primitive */ \"(ssr)/./node_modules/.pnpm/@radix-ui+react-primitive@2.0.2_@types+react-dom@19.0.3_@types+react@18.3.18__@types+re_e7e84ccdc284310f4be757cbae42c682/node_modules/@radix-ui/react-primitive/dist/index.mjs\");\n/* harmony import */ var react_jsx_runtime__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! react/jsx-runtime */ \"(ssr)/./node_modules/.pnpm/next@15.0.4_react-dom@19.0.0_react@19.0.0__react@19.0.0/node_modules/next/dist/server/route-modules/app-page/vendored/ssr/react-jsx-runtime.js\");\n/* __next_internal_client_entry_do_not_use__ Avatar,AvatarFallback,AvatarImage,Fallback,Image,Root,createAvatarScope auto */ // packages/react/avatar/src/avatar.tsx\n\n\n\n\n\n\nvar AVATAR_NAME = \"Avatar\";\nvar [createAvatarContext, createAvatarScope] = (0,_radix_ui_react_context__WEBPACK_IMPORTED_MODULE_2__.createContextScope)(AVATAR_NAME);\nvar [AvatarProvider, useAvatarContext] = createAvatarContext(AVATAR_NAME);\nvar Avatar = /*#__PURE__*/ react__WEBPACK_IMPORTED_MODULE_0__.forwardRef((props, forwardedRef)=>{\n    const { __scopeAvatar, ...avatarProps } = props;\n    const [imageLoadingStatus, setImageLoadingStatus] = react__WEBPACK_IMPORTED_MODULE_0__.useState(\"idle\");\n    return /* @__PURE__ */ (0,react_jsx_runtime__WEBPACK_IMPORTED_MODULE_1__.jsx)(AvatarProvider, {\n        scope: __scopeAvatar,\n        imageLoadingStatus,\n        onImageLoadingStatusChange: setImageLoadingStatus,\n        children: /* @__PURE__ */ (0,react_jsx_runtime__WEBPACK_IMPORTED_MODULE_1__.jsx)(_radix_ui_react_primitive__WEBPACK_IMPORTED_MODULE_3__.Primitive.span, {\n            ...avatarProps,\n            ref: forwardedRef\n        })\n    });\n});\nAvatar.displayName = AVATAR_NAME;\nvar IMAGE_NAME = \"AvatarImage\";\nvar AvatarImage = /*#__PURE__*/ react__WEBPACK_IMPORTED_MODULE_0__.forwardRef((props, forwardedRef)=>{\n    const { __scopeAvatar, src, onLoadingStatusChange = ()=>{}, ...imageProps } = props;\n    const context = useAvatarContext(IMAGE_NAME, __scopeAvatar);\n    const imageLoadingStatus = useImageLoadingStatus(src, imageProps.referrerPolicy);\n    const handleLoadingStatusChange = (0,_radix_ui_react_use_callback_ref__WEBPACK_IMPORTED_MODULE_4__.useCallbackRef)({\n        \"AvatarImage.useCallbackRef[handleLoadingStatusChange]\": (status)=>{\n            onLoadingStatusChange(status);\n            context.onImageLoadingStatusChange(status);\n        }\n    }[\"AvatarImage.useCallbackRef[handleLoadingStatusChange]\"]);\n    (0,_radix_ui_react_use_layout_effect__WEBPACK_IMPORTED_MODULE_5__.useLayoutEffect)({\n        \"AvatarImage.useLayoutEffect\": ()=>{\n            if (imageLoadingStatus !== \"idle\") {\n                handleLoadingStatusChange(imageLoadingStatus);\n            }\n        }\n    }[\"AvatarImage.useLayoutEffect\"], [\n        imageLoadingStatus,\n        handleLoadingStatusChange\n    ]);\n    return imageLoadingStatus === \"loaded\" ? /* @__PURE__ */ (0,react_jsx_runtime__WEBPACK_IMPORTED_MODULE_1__.jsx)(_radix_ui_react_primitive__WEBPACK_IMPORTED_MODULE_3__.Primitive.img, {\n        ...imageProps,\n        ref: forwardedRef,\n        src\n    }) : null;\n});\nAvatarImage.displayName = IMAGE_NAME;\nvar FALLBACK_NAME = \"AvatarFallback\";\nvar AvatarFallback = /*#__PURE__*/ react__WEBPACK_IMPORTED_MODULE_0__.forwardRef((props, forwardedRef)=>{\n    const { __scopeAvatar, delayMs, ...fallbackProps } = props;\n    const context = useAvatarContext(FALLBACK_NAME, __scopeAvatar);\n    const [canRender, setCanRender] = react__WEBPACK_IMPORTED_MODULE_0__.useState(delayMs === void 0);\n    react__WEBPACK_IMPORTED_MODULE_0__.useEffect({\n        \"AvatarFallback.useEffect\": ()=>{\n            if (delayMs !== void 0) {\n                const timerId = window.setTimeout({\n                    \"AvatarFallback.useEffect.timerId\": ()=>setCanRender(true)\n                }[\"AvatarFallback.useEffect.timerId\"], delayMs);\n                return ({\n                    \"AvatarFallback.useEffect\": ()=>window.clearTimeout(timerId)\n                })[\"AvatarFallback.useEffect\"];\n            }\n        }\n    }[\"AvatarFallback.useEffect\"], [\n        delayMs\n    ]);\n    return canRender && context.imageLoadingStatus !== \"loaded\" ? /* @__PURE__ */ (0,react_jsx_runtime__WEBPACK_IMPORTED_MODULE_1__.jsx)(_radix_ui_react_primitive__WEBPACK_IMPORTED_MODULE_3__.Primitive.span, {\n        ...fallbackProps,\n        ref: forwardedRef\n    }) : null;\n});\nAvatarFallback.displayName = FALLBACK_NAME;\nfunction useImageLoadingStatus(src, referrerPolicy) {\n    const [loadingStatus, setLoadingStatus] = react__WEBPACK_IMPORTED_MODULE_0__.useState(\"idle\");\n    (0,_radix_ui_react_use_layout_effect__WEBPACK_IMPORTED_MODULE_5__.useLayoutEffect)({\n        \"useImageLoadingStatus.useLayoutEffect\": ()=>{\n            if (!src) {\n                setLoadingStatus(\"error\");\n                return;\n            }\n            let isMounted = true;\n            const image = new window.Image();\n            const updateStatus = {\n                \"useImageLoadingStatus.useLayoutEffect.updateStatus\": (status)=>({\n                        \"useImageLoadingStatus.useLayoutEffect.updateStatus\": ()=>{\n                            if (!isMounted) return;\n                            setLoadingStatus(status);\n                        }\n                    })[\"useImageLoadingStatus.useLayoutEffect.updateStatus\"]\n            }[\"useImageLoadingStatus.useLayoutEffect.updateStatus\"];\n            setLoadingStatus(\"loading\");\n            image.onload = updateStatus(\"loaded\");\n            image.onerror = updateStatus(\"error\");\n            image.src = src;\n            if (referrerPolicy) {\n                image.referrerPolicy = referrerPolicy;\n            }\n            return ({\n                \"useImageLoadingStatus.useLayoutEffect\": ()=>{\n                    isMounted = false;\n                }\n            })[\"useImageLoadingStatus.useLayoutEffect\"];\n        }\n    }[\"useImageLoadingStatus.useLayoutEffect\"], [\n        src,\n        referrerPolicy\n    ]);\n    return loadingStatus;\n}\nvar Root = Avatar;\nvar Image = AvatarImage;\nvar Fallback = AvatarFallback;\n //# sourceMappingURL=index.mjs.map\n//# sourceURL=[module]\n//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiKHNzcikvLi9ub2RlX21vZHVsZXMvLnBucG0vQHJhZGl4LXVpK3JlYWN0LWF2YXRhckAxLjEuM19AdHlwZXMrcmVhY3QtZG9tQDE5LjAuM19AdHlwZXMrcmVhY3RAMTguMy4xOF9fQHR5cGVzK3JlYWN0X2YxNjcyODlhODVmMjU1ZTk0MTBkNzFjMWE0MTU0MjRmL25vZGVfbW9kdWxlcy9AcmFkaXgtdWkvcmVhY3QtYXZhdGFyL2Rpc3QvaW5kZXgubWpzIiwibWFwcGluZ3MiOiI7Ozs7Ozs7Ozs7Ozs7Ozs7O0FBQXVCO0FBQ1k7QUFDSjtBQUNDO0FBQ047QUFvQ2xCO0FBNUJSLElBQU0sY0FBYztBQUdwQixJQUFNLENBQUMscUJBQXFCLGlCQUFpQixJQUFJLDJFQUFrQixDQUFDLFdBQVc7QUFTL0UsSUFBTSxDQUFDLGdCQUFnQixnQkFBZ0IsSUFBSSxvQkFBd0MsV0FBVztBQU05RixJQUFNLHVCQUFlLDhDQUNuQixDQUFDLE9BQWlDO0lBQ2hDLE1BQU0sRUFBRSxlQUFlLEdBQUcsWUFBWSxJQUFJO0lBQzFDLE1BQU0sQ0FBQyxvQkFBb0IscUJBQXFCLElBQVUsNENBQTZCLE1BQU07SUFDN0YsT0FDRSx1RUFBQztRQUNDLE9BQU87UUFDUDtRQUNBLDRCQUE0QjtRQUU1QixpRkFBQyxnRUFBUyxDQUFDLE1BQVY7WUFBZ0IsR0FBRztZQUFhLEtBQUs7UUFBQSxDQUFjO0lBQUE7QUFHMUQ7QUFHRixPQUFPLGNBQWM7QUFNckIsSUFBTSxhQUFhO0FBUW5CLElBQU0sNEJBQW9CLDhDQUN4QixDQUFDLE9BQXNDO0lBQ3JDLE1BQU0sRUFBRSxlQUFlLEtBQUssd0JBQXdCLEtBQU8sR0FBRyxHQUFHLFdBQVcsSUFBSTtJQUNoRixNQUFNLFVBQVUsaUJBQWlCLFlBQVksYUFBYTtJQUMxRCxNQUFNLHFCQUFxQixzQkFBc0IsS0FBSyxXQUFXLGNBQWM7SUFDL0UsTUFBTSw0QkFBNEIsZ0ZBQWM7aUVBQUMsQ0FBQztZQUNoRCxzQkFBc0IsTUFBTTtZQUM1QixRQUFRLDJCQUEyQixNQUFNO1FBQzNDLENBQUM7O0lBRUQsa0ZBQWU7dUNBQUM7WUFDZCxJQUFJLHVCQUF1QixRQUFRO2dCQUNqQywwQkFBMEIsa0JBQWtCO1lBQzlDO1FBQ0Y7c0NBQUc7UUFBQztRQUFvQix5QkFBeUI7S0FBQztJQUVsRCxPQUFPLHVCQUF1QixXQUM1Qix1RUFBQyxnRUFBUyxDQUFDLEtBQVY7UUFBZSxHQUFHO1FBQVksS0FBSztRQUFjO0lBQUEsQ0FBVSxJQUMxRDtBQUNOO0FBR0YsWUFBWSxjQUFjO0FBTTFCLElBQU0sZ0JBQWdCO0FBT3RCLElBQU0sK0JBQXVCLDhDQUMzQixDQUFDLE9BQXlDO0lBQ3hDLE1BQU0sRUFBRSxlQUFlLFNBQVMsR0FBRyxjQUFjLElBQUk7SUFDckQsTUFBTSxVQUFVLGlCQUFpQixlQUFlLGFBQWE7SUFDN0QsTUFBTSxDQUFDLFdBQVcsWUFBWSxJQUFVLDRDQUFTLFlBQVksTUFBUztJQUVoRTtvQ0FBVTtZQUNkLElBQUksWUFBWSxRQUFXO2dCQUN6QixNQUFNLFVBQVUsT0FBTzt3REFBVyxJQUFNLGFBQWEsSUFBSTt1REFBRyxPQUFPO2dCQUNuRTtnREFBTyxJQUFNLE9BQU8sYUFBYSxPQUFPOztZQUMxQztRQUNGO21DQUFHO1FBQUMsT0FBTztLQUFDO0lBRVosT0FBTyxhQUFhLFFBQVEsdUJBQXVCLFdBQ2pELHVFQUFDLGdFQUFTLENBQUMsTUFBVjtRQUFnQixHQUFHO1FBQWUsS0FBSztJQUFBLENBQWMsSUFDcEQ7QUFDTjtBQUdGLGVBQWUsY0FBYztBQUk3QixTQUFTLHNCQUFzQixLQUFjLGdCQUFvRDtJQUMvRixNQUFNLENBQUMsZUFBZSxnQkFBZ0IsSUFBVSw0Q0FBNkIsTUFBTTtJQUVuRixrRkFBZTtpREFBQztZQUNkLElBQUksQ0FBQyxLQUFLO2dCQUNSLGlCQUFpQixPQUFPO2dCQUN4QjtZQUNGO1lBRUEsSUFBSSxZQUFZO1lBQ2hCLE1BQU0sUUFBUSxJQUFJLE9BQU8sTUFBTTtZQUUvQixNQUFNO3NFQUFlLENBQUM7OEVBQStCOzRCQUNuRCxJQUFJLENBQUMsVUFBVzs0QkFDaEIsaUJBQWlCLE1BQU07d0JBQ3pCOzs7WUFFQSxpQkFBaUIsU0FBUztZQUMxQixNQUFNLFNBQVMsYUFBYSxRQUFRO1lBQ3BDLE1BQU0sVUFBVSxhQUFhLE9BQU87WUFDcEMsTUFBTSxNQUFNO1lBQ1osSUFBSSxnQkFBZ0I7Z0JBQ2xCLE1BQU0saUJBQWlCO1lBQ3pCO1lBRUE7eURBQU87b0JBQ0wsWUFBWTtnQkFDZDs7UUFDRjtnREFBRztRQUFDO1FBQUssY0FBYztLQUFDO0lBRXhCLE9BQU87QUFDVDtBQUNBLElBQU0sT0FBTztBQUNiLElBQU0sUUFBUTtBQUNkLElBQU0sV0FBVyIsInNvdXJjZXMiOlsiL1VzZXJzL2FkdmFpdC5iaXRrYXJ0aGlyZHdhdmVjb2ZmZWUuaW4vRG9jdW1lbnRzL3R3Y193b3JrL2hlbGl1bV9mbHV0dGVyX3ZhbGlkYXRvci9zcmMvYXZhdGFyLnRzeCJdLCJzb3VyY2VzQ29udGVudCI6WyJpbXBvcnQgKiBhcyBSZWFjdCBmcm9tICdyZWFjdCc7XG5pbXBvcnQgeyBjcmVhdGVDb250ZXh0U2NvcGUgfSBmcm9tICdAcmFkaXgtdWkvcmVhY3QtY29udGV4dCc7XG5pbXBvcnQgeyB1c2VDYWxsYmFja1JlZiB9IGZyb20gJ0ByYWRpeC11aS9yZWFjdC11c2UtY2FsbGJhY2stcmVmJztcbmltcG9ydCB7IHVzZUxheW91dEVmZmVjdCB9IGZyb20gJ0ByYWRpeC11aS9yZWFjdC11c2UtbGF5b3V0LWVmZmVjdCc7XG5pbXBvcnQgeyBQcmltaXRpdmUgfSBmcm9tICdAcmFkaXgtdWkvcmVhY3QtcHJpbWl0aXZlJztcblxuaW1wb3J0IHR5cGUgeyBTY29wZSB9IGZyb20gJ0ByYWRpeC11aS9yZWFjdC1jb250ZXh0JztcblxuLyogLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLVxuICogQXZhdGFyXG4gKiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSovXG5cbmNvbnN0IEFWQVRBUl9OQU1FID0gJ0F2YXRhcic7XG5cbnR5cGUgU2NvcGVkUHJvcHM8UD4gPSBQICYgeyBfX3Njb3BlQXZhdGFyPzogU2NvcGUgfTtcbmNvbnN0IFtjcmVhdGVBdmF0YXJDb250ZXh0LCBjcmVhdGVBdmF0YXJTY29wZV0gPSBjcmVhdGVDb250ZXh0U2NvcGUoQVZBVEFSX05BTUUpO1xuXG50eXBlIEltYWdlTG9hZGluZ1N0YXR1cyA9ICdpZGxlJyB8ICdsb2FkaW5nJyB8ICdsb2FkZWQnIHwgJ2Vycm9yJztcblxudHlwZSBBdmF0YXJDb250ZXh0VmFsdWUgPSB7XG4gIGltYWdlTG9hZGluZ1N0YXR1czogSW1hZ2VMb2FkaW5nU3RhdHVzO1xuICBvbkltYWdlTG9hZGluZ1N0YXR1c0NoYW5nZShzdGF0dXM6IEltYWdlTG9hZGluZ1N0YXR1cyk6IHZvaWQ7XG59O1xuXG5jb25zdCBbQXZhdGFyUHJvdmlkZXIsIHVzZUF2YXRhckNvbnRleHRdID0gY3JlYXRlQXZhdGFyQ29udGV4dDxBdmF0YXJDb250ZXh0VmFsdWU+KEFWQVRBUl9OQU1FKTtcblxudHlwZSBBdmF0YXJFbGVtZW50ID0gUmVhY3QuRWxlbWVudFJlZjx0eXBlb2YgUHJpbWl0aXZlLnNwYW4+O1xudHlwZSBQcmltaXRpdmVTcGFuUHJvcHMgPSBSZWFjdC5Db21wb25lbnRQcm9wc1dpdGhvdXRSZWY8dHlwZW9mIFByaW1pdGl2ZS5zcGFuPjtcbmludGVyZmFjZSBBdmF0YXJQcm9wcyBleHRlbmRzIFByaW1pdGl2ZVNwYW5Qcm9wcyB7fVxuXG5jb25zdCBBdmF0YXIgPSBSZWFjdC5mb3J3YXJkUmVmPEF2YXRhckVsZW1lbnQsIEF2YXRhclByb3BzPihcbiAgKHByb3BzOiBTY29wZWRQcm9wczxBdmF0YXJQcm9wcz4sIGZvcndhcmRlZFJlZikgPT4ge1xuICAgIGNvbnN0IHsgX19zY29wZUF2YXRhciwgLi4uYXZhdGFyUHJvcHMgfSA9IHByb3BzO1xuICAgIGNvbnN0IFtpbWFnZUxvYWRpbmdTdGF0dXMsIHNldEltYWdlTG9hZGluZ1N0YXR1c10gPSBSZWFjdC51c2VTdGF0ZTxJbWFnZUxvYWRpbmdTdGF0dXM+KCdpZGxlJyk7XG4gICAgcmV0dXJuIChcbiAgICAgIDxBdmF0YXJQcm92aWRlclxuICAgICAgICBzY29wZT17X19zY29wZUF2YXRhcn1cbiAgICAgICAgaW1hZ2VMb2FkaW5nU3RhdHVzPXtpbWFnZUxvYWRpbmdTdGF0dXN9XG4gICAgICAgIG9uSW1hZ2VMb2FkaW5nU3RhdHVzQ2hhbmdlPXtzZXRJbWFnZUxvYWRpbmdTdGF0dXN9XG4gICAgICA+XG4gICAgICAgIDxQcmltaXRpdmUuc3BhbiB7Li4uYXZhdGFyUHJvcHN9IHJlZj17Zm9yd2FyZGVkUmVmfSAvPlxuICAgICAgPC9BdmF0YXJQcm92aWRlcj5cbiAgICApO1xuICB9XG4pO1xuXG5BdmF0YXIuZGlzcGxheU5hbWUgPSBBVkFUQVJfTkFNRTtcblxuLyogLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLVxuICogQXZhdGFySW1hZ2VcbiAqIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKi9cblxuY29uc3QgSU1BR0VfTkFNRSA9ICdBdmF0YXJJbWFnZSc7XG5cbnR5cGUgQXZhdGFySW1hZ2VFbGVtZW50ID0gUmVhY3QuRWxlbWVudFJlZjx0eXBlb2YgUHJpbWl0aXZlLmltZz47XG50eXBlIFByaW1pdGl2ZUltYWdlUHJvcHMgPSBSZWFjdC5Db21wb25lbnRQcm9wc1dpdGhvdXRSZWY8dHlwZW9mIFByaW1pdGl2ZS5pbWc+O1xuaW50ZXJmYWNlIEF2YXRhckltYWdlUHJvcHMgZXh0ZW5kcyBQcmltaXRpdmVJbWFnZVByb3BzIHtcbiAgb25Mb2FkaW5nU3RhdHVzQ2hhbmdlPzogKHN0YXR1czogSW1hZ2VMb2FkaW5nU3RhdHVzKSA9PiB2b2lkO1xufVxuXG5jb25zdCBBdmF0YXJJbWFnZSA9IFJlYWN0LmZvcndhcmRSZWY8QXZhdGFySW1hZ2VFbGVtZW50LCBBdmF0YXJJbWFnZVByb3BzPihcbiAgKHByb3BzOiBTY29wZWRQcm9wczxBdmF0YXJJbWFnZVByb3BzPiwgZm9yd2FyZGVkUmVmKSA9PiB7XG4gICAgY29uc3QgeyBfX3Njb3BlQXZhdGFyLCBzcmMsIG9uTG9hZGluZ1N0YXR1c0NoYW5nZSA9ICgpID0+IHt9LCAuLi5pbWFnZVByb3BzIH0gPSBwcm9wcztcbiAgICBjb25zdCBjb250ZXh0ID0gdXNlQXZhdGFyQ29udGV4dChJTUFHRV9OQU1FLCBfX3Njb3BlQXZhdGFyKTtcbiAgICBjb25zdCBpbWFnZUxvYWRpbmdTdGF0dXMgPSB1c2VJbWFnZUxvYWRpbmdTdGF0dXMoc3JjLCBpbWFnZVByb3BzLnJlZmVycmVyUG9saWN5KTtcbiAgICBjb25zdCBoYW5kbGVMb2FkaW5nU3RhdHVzQ2hhbmdlID0gdXNlQ2FsbGJhY2tSZWYoKHN0YXR1czogSW1hZ2VMb2FkaW5nU3RhdHVzKSA9PiB7XG4gICAgICBvbkxvYWRpbmdTdGF0dXNDaGFuZ2Uoc3RhdHVzKTtcbiAgICAgIGNvbnRleHQub25JbWFnZUxvYWRpbmdTdGF0dXNDaGFuZ2Uoc3RhdHVzKTtcbiAgICB9KTtcblxuICAgIHVzZUxheW91dEVmZmVjdCgoKSA9PiB7XG4gICAgICBpZiAoaW1hZ2VMb2FkaW5nU3RhdHVzICE9PSAnaWRsZScpIHtcbiAgICAgICAgaGFuZGxlTG9hZGluZ1N0YXR1c0NoYW5nZShpbWFnZUxvYWRpbmdTdGF0dXMpO1xuICAgICAgfVxuICAgIH0sIFtpbWFnZUxvYWRpbmdTdGF0dXMsIGhhbmRsZUxvYWRpbmdTdGF0dXNDaGFuZ2VdKTtcblxuICAgIHJldHVybiBpbWFnZUxvYWRpbmdTdGF0dXMgPT09ICdsb2FkZWQnID8gKFxuICAgICAgPFByaW1pdGl2ZS5pbWcgey4uLmltYWdlUHJvcHN9IHJlZj17Zm9yd2FyZGVkUmVmfSBzcmM9e3NyY30gLz5cbiAgICApIDogbnVsbDtcbiAgfVxuKTtcblxuQXZhdGFySW1hZ2UuZGlzcGxheU5hbWUgPSBJTUFHRV9OQU1FO1xuXG4vKiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXG4gKiBBdmF0YXJGYWxsYmFja1xuICogLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0qL1xuXG5jb25zdCBGQUxMQkFDS19OQU1FID0gJ0F2YXRhckZhbGxiYWNrJztcblxudHlwZSBBdmF0YXJGYWxsYmFja0VsZW1lbnQgPSBSZWFjdC5FbGVtZW50UmVmPHR5cGVvZiBQcmltaXRpdmUuc3Bhbj47XG5pbnRlcmZhY2UgQXZhdGFyRmFsbGJhY2tQcm9wcyBleHRlbmRzIFByaW1pdGl2ZVNwYW5Qcm9wcyB7XG4gIGRlbGF5TXM/OiBudW1iZXI7XG59XG5cbmNvbnN0IEF2YXRhckZhbGxiYWNrID0gUmVhY3QuZm9yd2FyZFJlZjxBdmF0YXJGYWxsYmFja0VsZW1lbnQsIEF2YXRhckZhbGxiYWNrUHJvcHM+KFxuICAocHJvcHM6IFNjb3BlZFByb3BzPEF2YXRhckZhbGxiYWNrUHJvcHM+LCBmb3J3YXJkZWRSZWYpID0+IHtcbiAgICBjb25zdCB7IF9fc2NvcGVBdmF0YXIsIGRlbGF5TXMsIC4uLmZhbGxiYWNrUHJvcHMgfSA9IHByb3BzO1xuICAgIGNvbnN0IGNvbnRleHQgPSB1c2VBdmF0YXJDb250ZXh0KEZBTExCQUNLX05BTUUsIF9fc2NvcGVBdmF0YXIpO1xuICAgIGNvbnN0IFtjYW5SZW5kZXIsIHNldENhblJlbmRlcl0gPSBSZWFjdC51c2VTdGF0ZShkZWxheU1zID09PSB1bmRlZmluZWQpO1xuXG4gICAgUmVhY3QudXNlRWZmZWN0KCgpID0+IHtcbiAgICAgIGlmIChkZWxheU1zICE9PSB1bmRlZmluZWQpIHtcbiAgICAgICAgY29uc3QgdGltZXJJZCA9IHdpbmRvdy5zZXRUaW1lb3V0KCgpID0+IHNldENhblJlbmRlcih0cnVlKSwgZGVsYXlNcyk7XG4gICAgICAgIHJldHVybiAoKSA9PiB3aW5kb3cuY2xlYXJUaW1lb3V0KHRpbWVySWQpO1xuICAgICAgfVxuICAgIH0sIFtkZWxheU1zXSk7XG5cbiAgICByZXR1cm4gY2FuUmVuZGVyICYmIGNvbnRleHQuaW1hZ2VMb2FkaW5nU3RhdHVzICE9PSAnbG9hZGVkJyA/IChcbiAgICAgIDxQcmltaXRpdmUuc3BhbiB7Li4uZmFsbGJhY2tQcm9wc30gcmVmPXtmb3J3YXJkZWRSZWZ9IC8+XG4gICAgKSA6IG51bGw7XG4gIH1cbik7XG5cbkF2YXRhckZhbGxiYWNrLmRpc3BsYXlOYW1lID0gRkFMTEJBQ0tfTkFNRTtcblxuLyogLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0qL1xuXG5mdW5jdGlvbiB1c2VJbWFnZUxvYWRpbmdTdGF0dXMoc3JjPzogc3RyaW5nLCByZWZlcnJlclBvbGljeT86IFJlYWN0LkhUTUxBdHRyaWJ1dGVSZWZlcnJlclBvbGljeSkge1xuICBjb25zdCBbbG9hZGluZ1N0YXR1cywgc2V0TG9hZGluZ1N0YXR1c10gPSBSZWFjdC51c2VTdGF0ZTxJbWFnZUxvYWRpbmdTdGF0dXM+KCdpZGxlJyk7XG5cbiAgdXNlTGF5b3V0RWZmZWN0KCgpID0+IHtcbiAgICBpZiAoIXNyYykge1xuICAgICAgc2V0TG9hZGluZ1N0YXR1cygnZXJyb3InKTtcbiAgICAgIHJldHVybjtcbiAgICB9XG5cbiAgICBsZXQgaXNNb3VudGVkID0gdHJ1ZTtcbiAgICBjb25zdCBpbWFnZSA9IG5ldyB3aW5kb3cuSW1hZ2UoKTtcblxuICAgIGNvbnN0IHVwZGF0ZVN0YXR1cyA9IChzdGF0dXM6IEltYWdlTG9hZGluZ1N0YXR1cykgPT4gKCkgPT4ge1xuICAgICAgaWYgKCFpc01vdW50ZWQpIHJldHVybjtcbiAgICAgIHNldExvYWRpbmdTdGF0dXMoc3RhdHVzKTtcbiAgICB9O1xuXG4gICAgc2V0TG9hZGluZ1N0YXR1cygnbG9hZGluZycpO1xuICAgIGltYWdlLm9ubG9hZCA9IHVwZGF0ZVN0YXR1cygnbG9hZGVkJyk7XG4gICAgaW1hZ2Uub25lcnJvciA9IHVwZGF0ZVN0YXR1cygnZXJyb3InKTtcbiAgICBpbWFnZS5zcmMgPSBzcmM7XG4gICAgaWYgKHJlZmVycmVyUG9saWN5KSB7XG4gICAgICBpbWFnZS5yZWZlcnJlclBvbGljeSA9IHJlZmVycmVyUG9saWN5O1xuICAgIH1cblxuICAgIHJldHVybiAoKSA9PiB7XG4gICAgICBpc01vdW50ZWQgPSBmYWxzZTtcbiAgICB9O1xuICB9LCBbc3JjLCByZWZlcnJlclBvbGljeV0pO1xuXG4gIHJldHVybiBsb2FkaW5nU3RhdHVzO1xufVxuY29uc3QgUm9vdCA9IEF2YXRhcjtcbmNvbnN0IEltYWdlID0gQXZhdGFySW1hZ2U7XG5jb25zdCBGYWxsYmFjayA9IEF2YXRhckZhbGxiYWNrO1xuXG5leHBvcnQge1xuICBjcmVhdGVBdmF0YXJTY29wZSxcbiAgLy9cbiAgQXZhdGFyLFxuICBBdmF0YXJJbWFnZSxcbiAgQXZhdGFyRmFsbGJhY2ssXG4gIC8vXG4gIFJvb3QsXG4gIEltYWdlLFxuICBGYWxsYmFjayxcbn07XG5leHBvcnQgdHlwZSB7IEF2YXRhclByb3BzLCBBdmF0YXJJbWFnZVByb3BzLCBBdmF0YXJGYWxsYmFja1Byb3BzIH07XG4iXSwibmFtZXMiOltdLCJpZ25vcmVMaXN0IjpbXSwic291cmNlUm9vdCI6IiJ9\n//# sourceURL=webpack-internal:///(ssr)/./node_modules/.pnpm/@radix-ui+react-avatar@1.1.3_@types+react-dom@19.0.3_@types+react@18.3.18__@types+react_f167289a85f255e9410d71c1a415424f/node_modules/@radix-ui/react-avatar/dist/index.mjs\n");

/***/ })

};
;