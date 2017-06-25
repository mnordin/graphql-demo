# README

## Try it out

Go to [Graphiql](https://lit-lake-39706.herokuapp.com) on heroku and try it out for yourself!
Some mutations require a logged in user. You can log in as any existing user on the [front page](https://lit-lake-39706.herokuapp.com).

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

### Creating a post
```
mutation {
  createPost(input: {title: "Title", content: "Content"}) {
    post {
      id
      title
      content
      user {
        name
      }
    }
  }
}
```

## Setting up locally


```
bundle install
rake db:setup
rails s
```

### Ruby version

2.4.1
