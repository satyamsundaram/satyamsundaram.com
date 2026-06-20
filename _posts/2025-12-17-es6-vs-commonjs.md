---
layout: post
title: "ES6 vs CommonJS modules explained"
date: 2025-12-17
---

For starters, let us understand what ES6 and CommonJS are, as well as their history.

*   ES6 stands for ECMAScript 6. ECMAScript was created to standardize JavaScript.
    
*   CommonJS is a project with the goal to establish conventions on the module ecosystem for **JavaScript outside of the web browser**. CommonJS's module specification is widely used today, in particular for server-side JavaScript programming with **Node.js**. It is also used in the development of browser-side JavaScript, but the code must be packaged with a transpiler since browsers don't support CommonJS.
    

CommonJS started in 2009 and ES1 was released in 1997.

### How to distinguish between them?

*   CommonJS can be recognized by the use of the `require()` function and `module.exports`.
    
*   ES modules use `import` and `export` (or `export default`) statements for similar (though not identical) functionality.
    

### What is a module?

A module is a Javascript file, i.e., each file in Javascript is treated as an independent, isolated module. It is only when we export it, that it is no longer isolated.

However, unlike a normal Javascript file, a module can specify which variables and functions can be accessed outside the module. Other sections of the module cannot be accessed. A module can also load other modules.

We use modules to reduce the number of lines of code in one file, make our code modular and isolate our code in order to prevent overwriting it (which can happen when we have a lot of global variables and code all in the same file).

### How to use the CommonJS module system (which is the default) in Node.js?

#### Export:

```javascript
// to export a package from some module, say foo.js
const function1 = () => {};

const function2 = () => {};

module.exports = {function1, function2};

/******** another way to export ********/
// or we add our function to exports as we declare it
exports.function3 = () => {};
```

#### Import:

```javascript
// to import foo.js in some other file, say index.js
const foo = require('./foo.js'); // relative path given foo.js and index.js are in the same folder

// for a package after installing it
const axios = require("axios"); // given the package supports CommonJS system

// to use the functions inside foo.js
foo.function1();
foo.function2();
foo.function3();

/******** another way to import ********/
const {function1, function2, function3} = require("./foo.js"); // using destructuring

// now we can use them directly
function1();
function2();
function3();
```

### How to use the ES6 module system in Node.js?

To use the ES6 module system in Node.js, we have to add an additional key-value in our package.json which is `"type": "module"`. By, this we specify Node.js to treat all .js files as modules. Any JS file importing other modules becomes the "top-level module" for the imported modules.

#### Export:

```javascript
// to export a package from some module, say foo.js
const function1 = () => {};

const function2 = () => {};

export default {function1, function2};

/******** another way to export ********/
// or we export them as we declare it
export const function3 = () => {};
```

#### Import:

```javascript
// to import foo.js in some other file, say index.js
import {function1, function2, function3} = from "./foo.js"; // relative path again

// for a package after installing it
import chalk from "chalk"; // given the package supports ES6 system

// now we can use them
function1();
function2();
function3();
```

### ES6 vs CommonJS (and why ES6 is better?)

#### require() in CommonJS vs import in ES6

require is a function, hence it can be called anywhere in our code, even inside a code block (like an if statement or a for loop) but the same can't be done with import. We always have to import at the top aka root level of our code.

*   As we see above, require is just a function, hence it is called at runtime where import is static and checked at parse time rather than runtime. ES6 modules are pre-parsed in order to resolve further imports before the code is executed. CommonJS modules-load dependencies on demand while executing the code. Thus, we'll get all our errors beforehand in parse time (which is the case for import) and not in runtime (which is the case for require).
    
*   There are also certain helpful tools for static analysing which greatly benefit in writing error-free code. These tools can be used with import but not with require.
    
*   all our imports are hoisted which means that no matter where we put them, they will always be parsed and moved to the top.
    
*   all exports from ES6 are static which means we really know what modules we are importing.
    

### So, why are CommonJS modules still around in Node if ES6 modules are better?

Because it is super difficult to get rid of the huge codebase in CommonJS all at once that has been supporting modules in Node for all these years. So, we have two first-class module systems in Node and having both CJS and ESM supported means there will be a fragmented community if the authors of packages decide to exclude one part of it by shipping a non-dual ESM package.

[The solution to that fragmentation is community pressure on those authors, and/or abandoning those authors.](https://github.com/nodejs/node/issues/33954#issuecomment-776878379)

### References:

1.  [Monsterlessons Academy](https://youtu.be/mK54Cn4ceac)
    
2.  [usefulAngle.com](https://usefulangle.com/post/252/script-type-module)