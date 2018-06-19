- @title = "#{post["title"]} - Blog - Amber Framework"
- @meta = "#{post["title"]} - A post on Amber Framework blog"
header.header.header-inverse.h-fullscreen.pb-80 style="background-image: url(#{post["image"]});"  data-overlay="8"
  .container.text-center
    .row.h-full
      .col-12.col-lg-8.offset-lg-2.align-self-center
        p.opacity-70.post-date
          = post["date"]
        br
        h1.display-4.hidden-sm-down
          = post["title"]
        h1.hidden-md-up
          = post["title"]
        br
        p.post-author
          span.opacity-70.mr-8 By
          a.text-white href="#{post["profile"]}"
            = post["author"]
        p.post-author-avatar
          img.rounded-circle.w-40 src="#{post["profile"]}.png" alt="Author avatar" title="#{post["author"]}"
      .col-12.align-self-end.text-center
        a.scroll-down-1.scroll-down-inverse href="#section-content"
          span
main.main-content
  .section#section-content
    .container
      .row
        .col-12.col-lg-8.offset-lg-2
          == Markdown.to_html(File.read(filepath))
          h2 Leave a comment
          == render_template "layouts/_disqus.slang"