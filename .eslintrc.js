module.exports = {
  root: true,
  env: {
    browser: true,
    jquery: true,
  },
  extends: [
    'eslint:recommended',
    'airbnb-base/legacy'
  ],
  rules: {
    'comma-dangle': [
      'warn',
      {
        arrays: 'always-multiline',
        objects: 'always-multiline',
        imports: 'always-multiline',
        exports: 'always-multiline',
        functions: 'never',
      },
    ],
    curly: ['error', 'all'],
    indent: ['warn', 2],
    'max-len': [
      'warn',
      {
        code: 255,
        comments: 120,
        ignoreStrings: true,
        ignoreTemplateLiterals: true,
        ignoreRegExpLiterals: true,
      },
    ],
    'no-continue': 'off',
    'no-unused-vars': ['warn', { args: 'after-used' }],
    'no-use-before-define': ['error', { functions: false }],
    'padded-blocks': ['warn', 'never'],
    'quote-props': ['warn', 'consistent'],
    quotes: ['warn', 'single', { avoidEscape: true }],
    radix: ['warn', 'as-needed'],
    'space-before-function-paren': ['warn', 'always'],
  },
};
