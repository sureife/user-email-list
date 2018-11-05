# Do not fork this repo

Do not create a fork and a pull request.
Please download this repo, do some changes and push to your own repo. Public or private (bitbucket has free private repos) and send us a link.

# Install

1. Install Docker.

2. Run

3. Add "SENTRY_DSN" to environment for error tracking

```
make app-initialise-docker

make app-start
```

http://localhost:3000/users/ - Users list

# The task

We have example application with a low quality code in it.

1. Refactor and improve the existing code as much as possible.
2. Track of all the email addresses a user has had in its history and display it on the user page.

There is no need to make the html pretty. It's okay as it is now.

Feel free to alter database tables, add new gems and files. We expect the code to be production ready.
