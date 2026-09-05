---
name: code-python-style
description: Try to apply these local style guidelines when starting a new python project, adding features to an existing python project, or improving a python project.
---

# Python Style

Aim toward a very modern style of python with the use of type hints and other features to fail fast, fail or warn in testing and checking phases, and create expressive code that minimises the need to reflect on other files or functions to understand what is happening at any particular place in the code.
- Use `pyright`
- Use `pydantic`
- Use `ruff`
- Use `uv`

If using a database:
- Use `SQLModel`

For CI/CD pipelines and the strict test moments
- Use `mypy --strict`

Use modern python features and coding principles:
- The `type` keyword
- Modern generic functions when reasonable
- Accept abstract input types (for bounded flexibilty), return concrete types (to reduce type casting)
- Return `Self` to enable fluent call chains
    - Chaining in moderation can enable valuable compact expressions
    - Long chains (`x.a().b().c().d().e().f()` etc) can mean too many concepts are mixed in a single line, and extracting a part of the chain can sometimes create a usefully named unit.
- Use `Literal` for precise value checking
- Use `Annotated` to attache 3rd-party metadata like validation rules

If other modern techniques that serve to make data clear come into view, use them also.

## Python features to use with caution

Stay as close as possible to the standard meanings of special methods (so call dunder methods)
- Don't use special methods just to create quirky compact layouts that require knowledge of the unique domain of your program
- You should only need knowledge of core Python concepts to correctly interpret the use of special methods

Minimise the use of thrown exceptions and catch
- Unit seams are meant to protect callers of the seam from the underlying implementation hidden in the unit, and exceptions often reveal implementation. (Refer to code-quality to understand this unit and seam model of code organisation.)
- In general, reserve exceptions for system panic type errors and unrecoverable errors arrising outside our own code, not for predictable or recoverable errors in our domain logic.
- Consider the use of a library like `safe-result` to create clear local visibility of errors, particularly when errors are are normal part of the domain, or when working with async code.
- Throwing exception has a good use in special methods, like throwing `StopIteration` from `__next()__`. This embodies the principle of using special methods in the way they were intended.
