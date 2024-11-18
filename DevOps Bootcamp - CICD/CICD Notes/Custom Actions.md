# **CUSTOM ACTIONS**
Using reuseable actions helps maintain **consistency** across different repositories. By standardizing your CICD process, you ensure that all your projects follow the same steps and quality checks. This reduces the liklihood for errors and makes sure your workflows are more predictable. It also ensure **efficency** as Reuseable actions saves a lot of time and effort.

## **What are Custom Actions?**:
Custom actions are reuseable units of code that automate specific tasks in your CICD pipeline. Examples are:
- **Javascript Actions**: They use Node.js to run javascipt code.
- **Docker Actions**: Runs in containers.
- **Composite Actions**: Which are PC's that are reuseable.

## **How to create a Custom Action**:
1) Create a New Repositiory for your action. `coderco-custom`
2) Define the Action Metadata in an `action.yml` file.
3) Write COde for your action (Index for js, dockerfile for docker, for composite combine multiple steps).
4) Publish Your ACtion to Github Marketplace (optional).

### WALKTHROUGH: Creating a Custom Action:
Here is an example of an `action.yml` file.

**1) Create your  `action.yml` file.**

```
name: CoderCo Custom Action

description: Greet someone

inputs:                                           # inputs from the user
  who-to-greet:
    description: who to greet
    required: true                                # required input from user      
    default: Hello 

outputs:
  time:
    description: time greeted

runs:
  using: node20
  main: dist/index.js                             # runs from main at this destination. Create a index.js file and fill it in.
```
run `npm init -y` to initialize it and add the `package.json` file.

**2) Create your index.js file, add your `outputs` in the `action.yml` file. Then enter:**
```
npm install @actions/core --save
```
 this adds your `package.lock` file.

**3) Now we have the function (the github action itself `index.js`), and the custom action (input and outputs). We compile it by installing everything we need:**
```
npm -i -g @vercel/ncc
```
then
```
ncc build index.js        # (optional to add) --license licenses.txt 
```

Add large files to your .gitignore, such as node_modules with *node_modules. Add and commit !

### How to Use a Custom Action:
In your `main.yaml` file under `.github/workflows` add the steps below and push it to github.
```
-name: hello world custom action
 uses: CoderCo-Learning/coderco-custom@main                     # referencing your coder-custom repo's main branch
 with:
   who-to-greet: 'CoderCo Team'
```

This will return

```
Hello, CoderCo Team
```


