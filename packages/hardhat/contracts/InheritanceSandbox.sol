// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "hardhat/console.sol";

/* Graph of inheritance
    A
   / \
  B   C
 / \ /
F  D,E

*/

contract A {
    function foo() public view virtual {
        console.log("A.foo() called");
        console.log("A");
    }
}

// Contracts inherit other contracts by using the keyword 'is'.
contract B is A {
    // Override A.foo()
    function foo() public view virtual override {
        console.log("B.foo() called");
        console.log("B");
    }
}

contract C is A {
    // Override A.foo()
    function foo() public view virtual override {
        console.log("C.foo() called");
        console.log("C");
    }
}

// Contracts can inherit from multiple parent contracts.
// When a function is called that is defined multiple times in
// different contracts, parent contracts are searched from
// right to left, and in depth-first manner.

contract D is B, C {
    // D.foo() prints "C"
    // since C is the right most parent contract with function foo()
    function foo() public view override(B, C) {
        console.log("D.foo() called");
        super.foo();
    }
}

contract E is C, B {
    // E.foo() prints "B"
    // since B is the right most parent contract with function foo()
    function foo() public view override(C, B) {
        console.log("E.foo() called");
        super.foo();
    }
}

// Inheritance must be ordered from “most base-like” to “most derived”.
// Swapping the order of A and B will throw a compilation error.
contract F is A, B {
    function foo() public view override(A, B) {
        console.log("F.foo() called");
        super.foo();
    }
}

contract InheritanceSandbox {
    constructor(string memory _message) {
        console.log("Deploying a InheritanceSandbox", _message);
    }

    function test() public {
        A a = new A();
        B b = new B();
        C c = new C();
        D d = new D();
        E e = new E();
        F f = new F();

        a.foo();
        b.foo();
        c.foo();
        d.foo();
        e.foo();
        f.foo();
    }
}
