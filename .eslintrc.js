module.exports = {
  root: true,
  extends: 'eslint:recommended',
  parserOptions: {
    ecmaVersion: 6
  },
  env: {
    node: true
  },
  rules: {
  	"no-undef": 1
  },
  overrides: [
    {
      files: [
        "components/**/client.js"
      ],
      env: {
        node: false,
        browser: true,
        amd: true
      },
      globals: {
        "DS": false
      }
    }
  ]
}
