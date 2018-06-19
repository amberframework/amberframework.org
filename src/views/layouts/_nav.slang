nav.topbar.topbar-inverse.topbar-expand-md.topbar-sticky
  div class="#{ @container_class }"
    .topbar-left
      button.topbar-toggler aria-label="Navbar menu icon"
        i.fa.fa-navicon.fs-25.p-4 aria-hidden="true" title="Show navbar menu"
      a.topbar-brand href="/"
        img.logo-default src="/assets/img/amber-logo-small-white.png" alt="amber logo" width="100"
    .topbar-right
      ul.topbar-nav.nav.text-light
        li.nav-item
          - active = context.request.path.starts_with?("/blog") ? "active" : ""
          a class="nav-link #{active}" href="/blog" Blog
        li.nav-item
          - active = context.request.path == "/media" ? "active" : ""
          a class="nav-link #{active}" href="/media"
            | Media
        li.nav-item
          a.nav-link href="https://docs.amberframework.org/amber" target="_blank"
            | Guides
        li.nav-item
          a.nav-link href="https://github.com/amberframework/amber" target="_blank"
            | Github
        li.nav-item
          a.nav-link href="https://gitter.im/amberframework/amber" target="_blank"
            | Gitter
        li.nav-item
          a.github-button data-show-count="true" href="https://github.com/amberframework/amber" aria-label="Star amberframework/amber on GitHub"
            | Star
