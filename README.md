# README

## Try it out

Go to https://lit-lake-39706.herokuapp.com/graphiql and try it out for yourself!

## Example queries
(More examples will be added)

### Fetching all the posts made by one user and all their comments
```
query {
  user(id: 1) {
    name
    posts {
      title
      content
      comments {
        user {
          name
        }
        content
      }
    }
  }
}
```

## Setting up locally

```
bundle install
rake db:migrate
rails s
```

### Ruby version

2.4.1
