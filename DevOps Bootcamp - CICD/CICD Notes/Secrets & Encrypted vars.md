# **SECRETS & ENCRYPTED VARIABLES**

## **How to call secrets**?
After adding a secret to your github settings. It can be called under `steps` in your `.yaml` file with:
```
steps:
-name: use secret
 run: echo "The secret is ${{ secrets.MY_SECRET }}"
 ```

 ### **Call Secrets as environment variables**:
You can call a secret as an environment variable with `env` as shown below. Or add it as a variable on your github repo settings.

```
 - name: use secret as environment variable.
   run: echo "The secret is ${{ secrets.MY_SECRET }}"
   
   env: 
    MY_SECRET: "${{ secrets.MY_SECRET }}"
```

