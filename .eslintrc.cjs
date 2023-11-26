module.exports = {
    root: true,
    env: { browser: true, es2020: true },
    extends: [
        'eslint:recommended',
        'plugin:@typescript-eslint/recommended-type-checked',
        'plugin:@typescript-eslint/stylistic-type-checked',
        'plugin:react-hooks/recommended',
        'plugin:prettier/recommended',
    ],
    ignorePatterns: [
        'dist',
        '.eslintrc.cjs',
        'vite.config.ts',
        'tailwind.config.js',
    ],
    parser: '@typescript-eslint/parser',
    plugins: ['react-refresh', 'prettier', '@typescript-eslint'],
    rules: {
        'react-refresh/only-export-components': [
            'warn',
            { allowConstantExport: true },
        ],
        'linebreak-style': ['error', 'unix'],
        eqeqeq: 'error',
        'object-curly-spacing': ['error', 'always'],
        'no-console': 0,
        'react/prop-types': 0,
        'react/react-in-jsx-scope': 'off',
        'prettier/prettier': 'error',
        '@typescript-eslint/consistent-type-definitions': 0,
    },
    parserOptions: {
        project: './tsconfig.json',
    },
};
