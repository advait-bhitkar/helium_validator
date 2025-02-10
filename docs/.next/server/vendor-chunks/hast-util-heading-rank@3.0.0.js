"use strict";
/*
 * ATTENTION: An "eval-source-map" devtool has been used.
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file with attached SourceMaps in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
exports.id = "vendor-chunks/hast-util-heading-rank@3.0.0";
exports.ids = ["vendor-chunks/hast-util-heading-rank@3.0.0"];
exports.modules = {

/***/ "(rsc)/./node_modules/.pnpm/hast-util-heading-rank@3.0.0/node_modules/hast-util-heading-rank/lib/index.js":
/*!**********************************************************************************************************!*\
  !*** ./node_modules/.pnpm/hast-util-heading-rank@3.0.0/node_modules/hast-util-heading-rank/lib/index.js ***!
  \**********************************************************************************************************/
/***/ ((__unused_webpack___webpack_module__, __webpack_exports__, __webpack_require__) => {

eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export */ __webpack_require__.d(__webpack_exports__, {\n/* harmony export */   headingRank: () => (/* binding */ headingRank)\n/* harmony export */ });\n/**\n * @typedef {import('hast').Nodes} Nodes\n */\n\n/**\n * Get the rank (`1` to `6`) of headings (`h1` to `h6`).\n *\n * @param {Nodes} node\n *   Node to check.\n * @returns {number | undefined}\n *   Rank of the heading or `undefined` if not a heading.\n */\nfunction headingRank(node) {\n  const name = node.type === 'element' ? node.tagName.toLowerCase() : ''\n  const code =\n    name.length === 2 && name.charCodeAt(0) === 104 /* `h` */\n      ? name.charCodeAt(1)\n      : 0\n  return code > 48 /* `0` */ && code < 55 /* `7` */\n    ? code - 48 /* `0` */\n    : undefined\n}\n//# sourceURL=[module]\n//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiKHJzYykvLi9ub2RlX21vZHVsZXMvLnBucG0vaGFzdC11dGlsLWhlYWRpbmctcmFua0AzLjAuMC9ub2RlX21vZHVsZXMvaGFzdC11dGlsLWhlYWRpbmctcmFuay9saWIvaW5kZXguanMiLCJtYXBwaW5ncyI6Ijs7OztBQUFBO0FBQ0EsYUFBYSxzQkFBc0I7QUFDbkM7O0FBRUE7QUFDQTtBQUNBO0FBQ0EsV0FBVyxPQUFPO0FBQ2xCO0FBQ0EsYUFBYTtBQUNiO0FBQ0E7QUFDTztBQUNQO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQSIsInNvdXJjZXMiOlsiL1VzZXJzL2FkdmFpdC5iaXRrYXJ0aGlyZHdhdmVjb2ZmZWUuaW4vRG9jdW1lbnRzL3R3Y193b3JrL2hlbGl1bV9mbHV0dGVyX3ZhbGlkYXRvci9kb2NzL25vZGVfbW9kdWxlcy8ucG5wbS9oYXN0LXV0aWwtaGVhZGluZy1yYW5rQDMuMC4wL25vZGVfbW9kdWxlcy9oYXN0LXV0aWwtaGVhZGluZy1yYW5rL2xpYi9pbmRleC5qcyJdLCJzb3VyY2VzQ29udGVudCI6WyIvKipcbiAqIEB0eXBlZGVmIHtpbXBvcnQoJ2hhc3QnKS5Ob2Rlc30gTm9kZXNcbiAqL1xuXG4vKipcbiAqIEdldCB0aGUgcmFuayAoYDFgIHRvIGA2YCkgb2YgaGVhZGluZ3MgKGBoMWAgdG8gYGg2YCkuXG4gKlxuICogQHBhcmFtIHtOb2Rlc30gbm9kZVxuICogICBOb2RlIHRvIGNoZWNrLlxuICogQHJldHVybnMge251bWJlciB8IHVuZGVmaW5lZH1cbiAqICAgUmFuayBvZiB0aGUgaGVhZGluZyBvciBgdW5kZWZpbmVkYCBpZiBub3QgYSBoZWFkaW5nLlxuICovXG5leHBvcnQgZnVuY3Rpb24gaGVhZGluZ1Jhbmsobm9kZSkge1xuICBjb25zdCBuYW1lID0gbm9kZS50eXBlID09PSAnZWxlbWVudCcgPyBub2RlLnRhZ05hbWUudG9Mb3dlckNhc2UoKSA6ICcnXG4gIGNvbnN0IGNvZGUgPVxuICAgIG5hbWUubGVuZ3RoID09PSAyICYmIG5hbWUuY2hhckNvZGVBdCgwKSA9PT0gMTA0IC8qIGBoYCAqL1xuICAgICAgPyBuYW1lLmNoYXJDb2RlQXQoMSlcbiAgICAgIDogMFxuICByZXR1cm4gY29kZSA+IDQ4IC8qIGAwYCAqLyAmJiBjb2RlIDwgNTUgLyogYDdgICovXG4gICAgPyBjb2RlIC0gNDggLyogYDBgICovXG4gICAgOiB1bmRlZmluZWRcbn1cbiJdLCJuYW1lcyI6W10sImlnbm9yZUxpc3QiOlswXSwic291cmNlUm9vdCI6IiJ9\n//# sourceURL=webpack-internal:///(rsc)/./node_modules/.pnpm/hast-util-heading-rank@3.0.0/node_modules/hast-util-heading-rank/lib/index.js\n");

/***/ })

};
;