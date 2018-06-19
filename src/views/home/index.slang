== render partial: "layouts/_header.slang"
main.main-content
  section.section
    .container
      header.section-header.mb-0
        h2
          | Bare metal performance
        p.lead
          | Amber provides the bare metal performance of the Crystal Language.
          br
          | It provides productivity and happiness through a powerful CLI and familiar design patterns seen in Kemal, Rails, Phoenix and other popular frameworks.
        hr
        p 
          | See how quickly you can get an Amber app up and running:
      .row
        .col-12.offset-md-2.col-md-8.mb-30
          .youtube-player data-id="nIHSuBhoYc0"
      .row.gap-y
        .col-12.col-md-6.col-xl-4
          .flexbox.gap-items-4
            div.icon
              i.fa.fa-tv.fs-25.pt-4.text-secondary
            div
              h5
                | Generators
              p
                | Use code generation and scaffolding features to rapidly build prototypes.

        .col-12.col-md-6.col-xl-4
          .flexbox.gap-items-4
            div.icon
              i.fa.fa-university.fs-25.pt-4.text-secondary
            div
              h5
                | MIT License
              p
                | Amber is licensed under the MIT license, which makes it perfect
                | for use in commercial applications.

        .col-12.col-md-6.col-xl-4
          .flexbox.gap-items-4
            div.icon
              i.fa.fa-cubes.fs-25.pt-4.text-secondary
            div
              h5
                | MVC Conventions
              p
                | Instead of having to plan where things go, Amber comes with a
                | set of conventions to guide you in developing your application.

        .col-12.col-md-6.col-xl-4
          .flexbox.gap-items-4
            div.icon
              i.fa.fa-user-secret.fs-25.pt-4.text-secondary
            div
              h5
                | Build Secure Apps
              p
                | Tools are built-in to prevent and mitigate common attacks against web applications.
                | Minimize the risk of SQL injection, form tampering, cross-site request
                | forgery, and several other attacks.

        .col-12.col-md-6.col-xl-4
          .flexbox.gap-items-4
            div.icon
              i.fa.fa-language.fs-25.pt-4.text-secondary
            div
              h5
                | Powered by Crystal
              p
                | Crystal is a type safe, compiled language inspired by the simplicity of Ruby.
                | Type safety means more errors are caught by the compiler during development,
                | so you can be more confident about your code working in production.

        .col-12.col-md-6.col-xl-4
          .flexbox.gap-items-4
            div.icon
              i.fa.fa-wrench.fs-25.pt-4.text-secondary
            div
              h5
                | The Right Amount of Tooling
              p
                | All of the tools you need are built-in: CLI, translations, database access, caching,
                | validation, authentication, deployments, and encryption of secrets.

  section.section.text-center.bg-gray
    .container
      .row
        .col-12.offset-md-3.col-md-6
          p
            img src="/assets/img/bootstrap-github-1.png" alt="github logo"
          br
          h3.fw-900.mb-20
            | Fork the project on GitHub
          p.lead
            strong
              | Amber
            |  is open source! It’s hosted, developed, and maintained on GitHub by folks like you.
          br
          a.btn.btn-lg.btn-round.shadow-3.btn-primary href="https://github.com/amberframework" target="_blank"
            | Contribute On Github

  section.section.pb-0.overflow-hidden
    .container.mb-50
      header.section-header
        p
          img src="/assets/img/cta.png" alt="image about community"
        h2
          | Community Driven
        hr
        p.lead
          | Contributing to Amber can be a rewarding way to learn, teach, and build experience with
          | Crystal framework development. Amber is a community effort and we want you to join.
      .flexbox.flex-grow-all.text-center.mx-auto.amber-stats
        div
          span.text-info.fs-50 30+
          br
          p
            a href="https://github.com/amberframework/amber/releases" target="_blank" Releases
              i.fa.fa-github
        div
          span.text-info.fs-50 1000+
          br
          p
            a href="https://github.com/amberframework/amber/stargazers" target="_blank" Stars
              i.fa.fa-star
        div
          span.text-info.fs-50 900+
          br
          p
            a href="https://github.com/amberframework/amber/graphs/contributors" target="_blank" Commits
              i.fa.fa-file-text
      br

  section.section.text-center
    .container
      header
        h3 Sponsors
        hr
      .partner
          css:
            #digitalocean div {
              width: 177px;
              height: 177px;
              background: url(/assets/img/powederd-by-digitalocean.png) no-repeat;
              background-size: 100%;
            }
            #digitalocean div:hover {
              background: url(/assets/img/powederd-by-digitalocean-blue.png) no-repeat;
              background-size: 100%;
            }

          a#digitalocean href="https://digitalocean.com" target="_blank"
            div alt="Hosting generously provided by Digital Ocean"
