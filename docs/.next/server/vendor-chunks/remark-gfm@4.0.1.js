"use strict";
/*
 * ATTENTION: An "eval-source-map" devtool has been used.
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file with attached SourceMaps in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
exports.id = "vendor-chunks/remark-gfm@4.0.1";
exports.ids = ["vendor-chunks/remark-gfm@4.0.1"];
exports.modules = {

/***/ "(rsc)/./node_modules/.pnpm/remark-gfm@4.0.1/node_modules/remark-gfm/lib/index.js":
/*!**********************************************************************************!*\
  !*** ./node_modules/.pnpm/remark-gfm@4.0.1/node_modules/remark-gfm/lib/index.js ***!
  \**********************************************************************************/
/***/ ((__unused_webpack___webpack_module__, __webpack_exports__, __webpack_require__) => {

eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export */ __webpack_require__.d(__webpack_exports__, {\n/* harmony export */   \"default\": () => (/* binding */ remarkGfm)\n/* harmony export */ });\n/* harmony import */ var mdast_util_gfm__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! mdast-util-gfm */ \"(rsc)/./node_modules/.pnpm/mdast-util-gfm@3.1.0/node_modules/mdast-util-gfm/lib/index.js\");\n/* harmony import */ var micromark_extension_gfm__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! micromark-extension-gfm */ \"(rsc)/./node_modules/.pnpm/micromark-extension-gfm@3.0.0/node_modules/micromark-extension-gfm/index.js\");\n/**\n * @import {Root} from 'mdast'\n * @import {Options} from 'remark-gfm'\n * @import {} from 'remark-parse'\n * @import {} from 'remark-stringify'\n * @import {Processor} from 'unified'\n */\n\n\n\n\n/** @type {Options} */\nconst emptyOptions = {}\n\n/**\n * Add support GFM (autolink literals, footnotes, strikethrough, tables,\n * tasklists).\n *\n * @param {Options | null | undefined} [options]\n *   Configuration (optional).\n * @returns {undefined}\n *   Nothing.\n */\nfunction remarkGfm(options) {\n  // @ts-expect-error: TS is wrong about `this`.\n  // eslint-disable-next-line unicorn/no-this-assignment\n  const self = /** @type {Processor<Root>} */ (this)\n  const settings = options || emptyOptions\n  const data = self.data()\n\n  const micromarkExtensions =\n    data.micromarkExtensions || (data.micromarkExtensions = [])\n  const fromMarkdownExtensions =\n    data.fromMarkdownExtensions || (data.fromMarkdownExtensions = [])\n  const toMarkdownExtensions =\n    data.toMarkdownExtensions || (data.toMarkdownExtensions = [])\n\n  micromarkExtensions.push((0,micromark_extension_gfm__WEBPACK_IMPORTED_MODULE_0__.gfm)(settings))\n  fromMarkdownExtensions.push((0,mdast_util_gfm__WEBPACK_IMPORTED_MODULE_1__.gfmFromMarkdown)())\n  toMarkdownExtensions.push((0,mdast_util_gfm__WEBPACK_IMPORTED_MODULE_1__.gfmToMarkdown)(settings))\n}\n//# sourceURL=[module]\n//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiKHJzYykvLi9ub2RlX21vZHVsZXMvLnBucG0vcmVtYXJrLWdmbUA0LjAuMS9ub2RlX21vZHVsZXMvcmVtYXJrLWdmbS9saWIvaW5kZXguanMiLCJtYXBwaW5ncyI6Ijs7Ozs7O0FBQUE7QUFDQSxZQUFZLE1BQU07QUFDbEIsWUFBWSxTQUFTO0FBQ3JCLGNBQWM7QUFDZCxjQUFjO0FBQ2QsWUFBWSxXQUFXO0FBQ3ZCOztBQUU2RDtBQUNsQjs7QUFFM0MsV0FBVyxTQUFTO0FBQ3BCOztBQUVBO0FBQ0E7QUFDQTtBQUNBO0FBQ0EsV0FBVyw0QkFBNEI7QUFDdkM7QUFDQSxhQUFhO0FBQ2I7QUFDQTtBQUNlO0FBQ2Y7QUFDQTtBQUNBLDBCQUEwQixpQkFBaUI7QUFDM0M7QUFDQTs7QUFFQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7O0FBRUEsMkJBQTJCLDREQUFHO0FBQzlCLDhCQUE4QiwrREFBZTtBQUM3Qyw0QkFBNEIsNkRBQWE7QUFDekMiLCJzb3VyY2VzIjpbIi9Vc2Vycy9hZHZhaXQuYml0a2FydGhpcmR3YXZlY29mZmVlLmluL0RvY3VtZW50cy90d2Nfd29yay9oZWxpdW1fZmx1dHRlcl92YWxpZGF0b3IvZG9jcy9ub2RlX21vZHVsZXMvLnBucG0vcmVtYXJrLWdmbUA0LjAuMS9ub2RlX21vZHVsZXMvcmVtYXJrLWdmbS9saWIvaW5kZXguanMiXSwic291cmNlc0NvbnRlbnQiOlsiLyoqXG4gKiBAaW1wb3J0IHtSb290fSBmcm9tICdtZGFzdCdcbiAqIEBpbXBvcnQge09wdGlvbnN9IGZyb20gJ3JlbWFyay1nZm0nXG4gKiBAaW1wb3J0IHt9IGZyb20gJ3JlbWFyay1wYXJzZSdcbiAqIEBpbXBvcnQge30gZnJvbSAncmVtYXJrLXN0cmluZ2lmeSdcbiAqIEBpbXBvcnQge1Byb2Nlc3Nvcn0gZnJvbSAndW5pZmllZCdcbiAqL1xuXG5pbXBvcnQge2dmbUZyb21NYXJrZG93biwgZ2ZtVG9NYXJrZG93bn0gZnJvbSAnbWRhc3QtdXRpbC1nZm0nXG5pbXBvcnQge2dmbX0gZnJvbSAnbWljcm9tYXJrLWV4dGVuc2lvbi1nZm0nXG5cbi8qKiBAdHlwZSB7T3B0aW9uc30gKi9cbmNvbnN0IGVtcHR5T3B0aW9ucyA9IHt9XG5cbi8qKlxuICogQWRkIHN1cHBvcnQgR0ZNIChhdXRvbGluayBsaXRlcmFscywgZm9vdG5vdGVzLCBzdHJpa2V0aHJvdWdoLCB0YWJsZXMsXG4gKiB0YXNrbGlzdHMpLlxuICpcbiAqIEBwYXJhbSB7T3B0aW9ucyB8IG51bGwgfCB1bmRlZmluZWR9IFtvcHRpb25zXVxuICogICBDb25maWd1cmF0aW9uIChvcHRpb25hbCkuXG4gKiBAcmV0dXJucyB7dW5kZWZpbmVkfVxuICogICBOb3RoaW5nLlxuICovXG5leHBvcnQgZGVmYXVsdCBmdW5jdGlvbiByZW1hcmtHZm0ob3B0aW9ucykge1xuICAvLyBAdHMtZXhwZWN0LWVycm9yOiBUUyBpcyB3cm9uZyBhYm91dCBgdGhpc2AuXG4gIC8vIGVzbGludC1kaXNhYmxlLW5leHQtbGluZSB1bmljb3JuL25vLXRoaXMtYXNzaWdubWVudFxuICBjb25zdCBzZWxmID0gLyoqIEB0eXBlIHtQcm9jZXNzb3I8Um9vdD59ICovICh0aGlzKVxuICBjb25zdCBzZXR0aW5ncyA9IG9wdGlvbnMgfHwgZW1wdHlPcHRpb25zXG4gIGNvbnN0IGRhdGEgPSBzZWxmLmRhdGEoKVxuXG4gIGNvbnN0IG1pY3JvbWFya0V4dGVuc2lvbnMgPVxuICAgIGRhdGEubWljcm9tYXJrRXh0ZW5zaW9ucyB8fCAoZGF0YS5taWNyb21hcmtFeHRlbnNpb25zID0gW10pXG4gIGNvbnN0IGZyb21NYXJrZG93bkV4dGVuc2lvbnMgPVxuICAgIGRhdGEuZnJvbU1hcmtkb3duRXh0ZW5zaW9ucyB8fCAoZGF0YS5mcm9tTWFya2Rvd25FeHRlbnNpb25zID0gW10pXG4gIGNvbnN0IHRvTWFya2Rvd25FeHRlbnNpb25zID1cbiAgICBkYXRhLnRvTWFya2Rvd25FeHRlbnNpb25zIHx8IChkYXRhLnRvTWFya2Rvd25FeHRlbnNpb25zID0gW10pXG5cbiAgbWljcm9tYXJrRXh0ZW5zaW9ucy5wdXNoKGdmbShzZXR0aW5ncykpXG4gIGZyb21NYXJrZG93bkV4dGVuc2lvbnMucHVzaChnZm1Gcm9tTWFya2Rvd24oKSlcbiAgdG9NYXJrZG93bkV4dGVuc2lvbnMucHVzaChnZm1Ub01hcmtkb3duKHNldHRpbmdzKSlcbn1cbiJdLCJuYW1lcyI6W10sImlnbm9yZUxpc3QiOlswXSwic291cmNlUm9vdCI6IiJ9\n//# sourceURL=webpack-internal:///(rsc)/./node_modules/.pnpm/remark-gfm@4.0.1/node_modules/remark-gfm/lib/index.js\n");

/***/ })

};
;