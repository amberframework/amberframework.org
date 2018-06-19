- @title = "Blog - Amber Framework"
- @meta = "Experiences and stories about Amber Framework"
header.header.header-inverse.overflow-hidden.orange-header
  .container.text-center
    .row
      .col-12.col-lg-8.offset-lg-2
        h1 Blog
        p.fs-20.opacity-70
          | Experiences and stories about
          br
          strong Amber Framework
main
  section.section.py-15
    .container.post-list
      ul
        - @posts.each do |post|
          li
            p = post["date"]
              | by
              a href="#{post["profile"]}"
                = post["author"]
            h2
              a.text-light-dark href="/#{post["file"].to_s.sub(/.md$/, "")}"
                = post["title"]
