# **ADVANCED GITHUB ACTIONS**

## **Conditions and Expressions**

**Conditions**: 
Conditions allow you to control when a job or set up should be run based on certain criterias.
```
# Run a step only if the previous step succeeded

- name: run tests
  run: python -m unittest discover
  if: success()
  ```
**Expressions**:
Expressions provide a way to peform calculations, manipulate strings and more within your workflow file.
```
# Print a message with the branch name. Referencing a branch name with ${{ }}

- name: Print branch namae
  run: echo The branch is${{ github.ref }}
```

## **Matrix builds and parallel testing**
Maxtrix builds allow you to run multiple job configurations in parallel. And the matrix strategy is how you can do this in github actions. Useful for testing across different environments.

```
jobs:
  build:
    runs-on: ubuntu-latest


# Including a matrix with multiple values in square brackets. Instead of one value (without a bracket)

    strategy:
      matrix:
        python-version: [3.7, 3.8, 3.9]            # Call "python-version" with ${{ matrix.python-version}}
```

When pushed, this will run 3 jobs. 
- build (3.7)
- build (3.8)
- build (3.9)