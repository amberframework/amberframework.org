- @title = "Request not found - Amber Framework"
header.header.header-inverse.overflow-hidden.orange-header
  .container.text-center
    .row
      .col-12.col-lg-8.offset-lg-2
        h1 The request was not found
        p.fs-20.opacity-80
          = context.request.method
          br
          strong = context.request.path
