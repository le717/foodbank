var process = require('process');
const tailwindcss = require('tailwindcss');
const autoprefixer = require('autoprefixer');
const purgecss = require("@fullhuman/postcss-purgecss")({
  content: ["./index.php"]
});

module.exports = {
  plugins: [
    require('postcss-import'),
    tailwindcss,
    ...(process.env.NODE_ENV === "production" ? [purgecss] : []),
    autoprefixer
  ]
}