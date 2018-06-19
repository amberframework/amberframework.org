- @title = "Oops! - Amber Framework"
header.header.header-inverse.overflow-hidden.orange-header
  .container.text-center
    .row
      .col-12.col-lg-8.offset-lg-2
        h1 Internal server error
        p.fs-20.opacity-80
          | Oops!, Something bad happened.
          br
          - if @development
            pre.backtrace = @ex.inspect_with_backtrace
