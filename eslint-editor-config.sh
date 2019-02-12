#!/bin/bash

YELLOW='\033[1;33m'
GREEN='\033[1;32m'
LCYAN='\033[1;36m'
NC='\033[0m' # No Color

echo -e "${GREEN}Starting Style Formatting Configuration... ${NC}"

echo -e "1/5 ${LCYAN}Local ESLint Installation... ${NC}"
yarn add eslint -D

echo -e "2/5 ${YELLOW}Airbnb Configuration Installation... ${NC}"
yarn add eslint-config-airbnb eslint-plugin-jsx-a11y eslint-plugin-import eslint-plugin-react babel-eslint -D

echo -e "3/5 ${LCYAN}prettier-eslint eslint --fix ... ${NC}"
yarn add prettier-eslint prettier-eslint-cli -D

echo -e "4/5 ${YELLOW}Creating .editorconfig ... ${NC}"
touch .editorconfig

echo '
# EditorConfig is awesome: http://EditorConfig.org

# top-most EditorConfig file
root = true

# Unix-style newlines with a newline ending every file
[*]
end_of_line = lf
insert_final_newline = true
indent_style = space
indent_size = 2
charset = utf-8
trim_trailing_whitespace = true

[*.md]
trim_trailing_whitespace = false

[*.json]
trim_trailing_whitespace = false
insert_final_newline = false
indent_style = space
indent_size = 2
' >> .editorconfig

echo -e "5/5 ${YELLOW}Creating ESLint ... ${NC}"
touch .eslintrc  .eslintignore

echo '{
  "extends": ["airbnb", "prettier", "react-app", "plugin:prettier/recommended"],
  "plugins": ["prettier"],
  "rules": {
    "comma-dangle" : ["error", "always-multiline"],
    "react/jsx-uses-vars": 2,
    "react/jsx-indent-props": [2, 2],
    "react/prop-types": [2,{ "skipUndeclared": true}],
    "react/display-name": [0, { "ignoreTranspilerName": false }],
    "prefer-const": "warn"
  }
}' >> .eslintrc

echo -e "${GREEN}Done, Let's Code !!! ${NC}"

# "fix:code": "prettier-eslint --write 'src/**/*.{js,jsx}' "
