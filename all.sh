#!/bin/sh -x

# remove previous build
( \
  FILES_BUILD="find . -maxdepth 2 -type d -name node_modules -o -name out -o -name release -o -name bower_components";
  echo "rm: node_modules/, out/, release/ bower_components/:" `$FILES_BUILD | wc -l` && \
  ($FILES_BUILD | xargs rm -fr) \
)

# build:
# vscode-languageserver-types
# vscode-jsonrpc
# vscode-languageclient

# build:
# monaco
rm -rf yarn.lock
yarn

# # run bower install for polymer
# ( \
#   echo `pwd` && \
#   bower install \
# )

# `npm run test` is a bad hack to get around commonjs module required
# for testing
#( \
#  echo `pwd` && \
#  npm link "vscode-languageserver-types" && \
#  npm link "vscode-languageclient" && \
#  npm install --unsafe-perm --silent && \
#  npm run compile && \
  # npm run test && \
#  npm run compile \
#)
