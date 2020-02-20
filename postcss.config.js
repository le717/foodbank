var process = require("process");
const tailwindcss = require("tailwindcss");
const autoprefixer = require("autoprefixer");
const purgecss = require("@fullhuman/postcss-purgecss")({
  content: ["./app/static/js/**/*.js", "./app/templates/**/*.html", "./app/templates/**/*.jinja2"],
  css: ["./app/static/css/**/*.css"]
});
const cssnano = require("cssnano")({
  preset: "default",
});

module.exports = {
  plugins: [
    require("postcss-import"),
    tailwindcss,
    ...(process.env.NODE_ENV === "production" ? [purgecss] : []),
    autoprefixer,
    ...(process.env.NODE_ENV === "production" ? [cssnano] : []),
  ]
}