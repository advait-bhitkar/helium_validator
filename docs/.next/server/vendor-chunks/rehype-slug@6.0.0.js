"use strict";
/*
 * ATTENTION: An "eval-source-map" devtool has been used.
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file with attached SourceMaps in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
exports.id = "vendor-chunks/rehype-slug@6.0.0";
exports.ids = ["vendor-chunks/rehype-slug@6.0.0"];
exports.modules = {

/***/ "(rsc)/./node_modules/.pnpm/rehype-slug@6.0.0/node_modules/rehype-slug/lib/index.js":
/*!************************************************************************************!*\
  !*** ./node_modules/.pnpm/rehype-slug@6.0.0/node_modules/rehype-slug/lib/index.js ***!
  \************************************************************************************/
/***/ ((__unused_webpack___webpack_module__, __webpack_exports__, __webpack_require__) => {

eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export */ __webpack_require__.d(__webpack_exports__, {\n/* harmony export */   \"default\": () => (/* binding */ rehypeSlug)\n/* harmony export */ });\n/* harmony import */ var github_slugger__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! github-slugger */ \"(rsc)/./node_modules/.pnpm/github-slugger@2.0.0/node_modules/github-slugger/index.js\");\n/* harmony import */ var hast_util_heading_rank__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! hast-util-heading-rank */ \"(rsc)/./node_modules/.pnpm/hast-util-heading-rank@3.0.0/node_modules/hast-util-heading-rank/lib/index.js\");\n/* harmony import */ var hast_util_to_string__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! hast-util-to-string */ \"(rsc)/./node_modules/.pnpm/hast-util-to-string@3.0.1/node_modules/hast-util-to-string/lib/index.js\");\n/* harmony import */ var unist_util_visit__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! unist-util-visit */ \"(rsc)/./node_modules/.pnpm/unist-util-visit@5.0.0/node_modules/unist-util-visit/lib/index.js\");\n/**\n * @typedef {import('hast').Root} Root\n */\n\n/**\n * @typedef Options\n *   Configuration (optional).\n * @property {string} [prefix='']\n *   Prefix to add in front of `id`s (default: `''`).\n */\n\n\n\n\n\n\n/** @type {Options} */\nconst emptyOptions = {}\nconst slugs = new github_slugger__WEBPACK_IMPORTED_MODULE_0__[\"default\"]()\n\n/**\n * Add `id`s to headings.\n *\n * @param {Options | null | undefined} [options]\n *   Configuration (optional).\n * @returns\n *   Transform.\n */\nfunction rehypeSlug(options) {\n  const settings = options || emptyOptions\n  const prefix = settings.prefix || ''\n\n  /**\n   * @param {Root} tree\n   *   Tree.\n   * @returns {undefined}\n   *   Nothing.\n   */\n  return function (tree) {\n    slugs.reset()\n\n    ;(0,unist_util_visit__WEBPACK_IMPORTED_MODULE_1__.visit)(tree, 'element', function (node) {\n      if ((0,hast_util_heading_rank__WEBPACK_IMPORTED_MODULE_2__.headingRank)(node) && !node.properties.id) {\n        node.properties.id = prefix + slugs.slug((0,hast_util_to_string__WEBPACK_IMPORTED_MODULE_3__.toString)(node))\n      }\n    })\n  }\n}\n//# sourceURL=[module]\n//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiKHJzYykvLi9ub2RlX21vZHVsZXMvLnBucG0vcmVoeXBlLXNsdWdANi4wLjAvbm9kZV9tb2R1bGVzL3JlaHlwZS1zbHVnL2xpYi9pbmRleC5qcyIsIm1hcHBpbmdzIjoiOzs7Ozs7OztBQUFBO0FBQ0EsYUFBYSxxQkFBcUI7QUFDbEM7O0FBRUE7QUFDQTtBQUNBO0FBQ0EsY0FBYyxRQUFRO0FBQ3RCO0FBQ0E7O0FBRTBDO0FBQ1E7QUFDTjtBQUNOOztBQUV0QyxXQUFXLFNBQVM7QUFDcEI7QUFDQSxrQkFBa0Isc0RBQWE7O0FBRS9CO0FBQ0E7QUFDQTtBQUNBLFdBQVcsNEJBQTRCO0FBQ3ZDO0FBQ0E7QUFDQTtBQUNBO0FBQ2U7QUFDZjtBQUNBOztBQUVBO0FBQ0EsYUFBYSxNQUFNO0FBQ25CO0FBQ0EsZUFBZTtBQUNmO0FBQ0E7QUFDQTtBQUNBOztBQUVBLElBQUksd0RBQUs7QUFDVCxVQUFVLG1FQUFXO0FBQ3JCLGlEQUFpRCw2REFBUTtBQUN6RDtBQUNBLEtBQUs7QUFDTDtBQUNBIiwic291cmNlcyI6WyIvVXNlcnMvYWR2YWl0LmJpdGthcnRoaXJkd2F2ZWNvZmZlZS5pbi9Eb2N1bWVudHMvdHdjX3dvcmsvaGVsaXVtX2ZsdXR0ZXJfdmFsaWRhdG9yL2RvY3Mvbm9kZV9tb2R1bGVzLy5wbnBtL3JlaHlwZS1zbHVnQDYuMC4wL25vZGVfbW9kdWxlcy9yZWh5cGUtc2x1Zy9saWIvaW5kZXguanMiXSwic291cmNlc0NvbnRlbnQiOlsiLyoqXG4gKiBAdHlwZWRlZiB7aW1wb3J0KCdoYXN0JykuUm9vdH0gUm9vdFxuICovXG5cbi8qKlxuICogQHR5cGVkZWYgT3B0aW9uc1xuICogICBDb25maWd1cmF0aW9uIChvcHRpb25hbCkuXG4gKiBAcHJvcGVydHkge3N0cmluZ30gW3ByZWZpeD0nJ11cbiAqICAgUHJlZml4IHRvIGFkZCBpbiBmcm9udCBvZiBgaWRgcyAoZGVmYXVsdDogYCcnYCkuXG4gKi9cblxuaW1wb3J0IEdpdGh1YlNsdWdnZXIgZnJvbSAnZ2l0aHViLXNsdWdnZXInXG5pbXBvcnQge2hlYWRpbmdSYW5rfSBmcm9tICdoYXN0LXV0aWwtaGVhZGluZy1yYW5rJ1xuaW1wb3J0IHt0b1N0cmluZ30gZnJvbSAnaGFzdC11dGlsLXRvLXN0cmluZydcbmltcG9ydCB7dmlzaXR9IGZyb20gJ3VuaXN0LXV0aWwtdmlzaXQnXG5cbi8qKiBAdHlwZSB7T3B0aW9uc30gKi9cbmNvbnN0IGVtcHR5T3B0aW9ucyA9IHt9XG5jb25zdCBzbHVncyA9IG5ldyBHaXRodWJTbHVnZ2VyKClcblxuLyoqXG4gKiBBZGQgYGlkYHMgdG8gaGVhZGluZ3MuXG4gKlxuICogQHBhcmFtIHtPcHRpb25zIHwgbnVsbCB8IHVuZGVmaW5lZH0gW29wdGlvbnNdXG4gKiAgIENvbmZpZ3VyYXRpb24gKG9wdGlvbmFsKS5cbiAqIEByZXR1cm5zXG4gKiAgIFRyYW5zZm9ybS5cbiAqL1xuZXhwb3J0IGRlZmF1bHQgZnVuY3Rpb24gcmVoeXBlU2x1ZyhvcHRpb25zKSB7XG4gIGNvbnN0IHNldHRpbmdzID0gb3B0aW9ucyB8fCBlbXB0eU9wdGlvbnNcbiAgY29uc3QgcHJlZml4ID0gc2V0dGluZ3MucHJlZml4IHx8ICcnXG5cbiAgLyoqXG4gICAqIEBwYXJhbSB7Um9vdH0gdHJlZVxuICAgKiAgIFRyZWUuXG4gICAqIEByZXR1cm5zIHt1bmRlZmluZWR9XG4gICAqICAgTm90aGluZy5cbiAgICovXG4gIHJldHVybiBmdW5jdGlvbiAodHJlZSkge1xuICAgIHNsdWdzLnJlc2V0KClcblxuICAgIHZpc2l0KHRyZWUsICdlbGVtZW50JywgZnVuY3Rpb24gKG5vZGUpIHtcbiAgICAgIGlmIChoZWFkaW5nUmFuayhub2RlKSAmJiAhbm9kZS5wcm9wZXJ0aWVzLmlkKSB7XG4gICAgICAgIG5vZGUucHJvcGVydGllcy5pZCA9IHByZWZpeCArIHNsdWdzLnNsdWcodG9TdHJpbmcobm9kZSkpXG4gICAgICB9XG4gICAgfSlcbiAgfVxufVxuIl0sIm5hbWVzIjpbXSwiaWdub3JlTGlzdCI6WzBdLCJzb3VyY2VSb290IjoiIn0=\n//# sourceURL=webpack-internal:///(rsc)/./node_modules/.pnpm/rehype-slug@6.0.0/node_modules/rehype-slug/lib/index.js\n");

/***/ })

};
;