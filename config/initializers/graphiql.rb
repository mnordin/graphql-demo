GraphiQL::Rails.config.initial_query = <<-EOS
# Welcome to GraphiQL
#
# GraphiQL is an in-browser IDE for writing, validating, and
# testing GraphQL queries.
#
# Type queries into this side of the screen, and you will
# see intelligent typeaheads aware of the current GraphQL type schema and
# live syntax and validation errors highlighted within the text.
#
# To bring up the auto-complete at any point, just press Ctrl-Space.
#
# Press the run button above, or Cmd-Enter to execute the query, and the result
# will appear in the pane to the right.
#
# Here is an example query you might enjoy running:

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

# Or try creating a post with some content
#
# mutation {
#   createPost(input: {title: "Title", content: "Content"}) {
#     post {
#       id
#       title
#       content
#       user {
#         name
#       }
#     }
#   }
# }
EOS
