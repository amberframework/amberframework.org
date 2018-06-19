- @title = "Media - Amber Framework"
- @meta = "Amber assets and guidelines to make use of"
header.header.header-inverse.overflow-hidden.orange-header
  .container.text-center
    .row
      .col-12.col-lg-8.offset-lg-2
        h1 Media
        p.fs-20.opacity-70
          | We’ve put together some assets and guidelines to make use of
          br
          strong Amber Brand and Logos
main
  section.section.overflow-hidden
    .container
      .row
        .col-12.col-md-6.pb-70
          h2 Font Used In Amber Logo
          p Typography plays an important role in communicating an overall tone and quality. Careful use of typography reinforces your personality and ensures clarity and harmony in all design elements.
          hr.w-50.ml-0
          .flexbox.flex-grow-all
            div
              h6.text-uppercase.fw-600 Minimo
              p
                | To have an eye-pleasing view, the corners are rounded and the  lowercases are made smaller than the
                | standard. With its soft structure, it is aimed to be legible even in the small sizes and also to be
                | suitable for usage as webfont and application font.
            div
              h6.text-uppercase.fw-600 Local Brewery
              p
                | Local Brewery is a vintage inspired font collection that includes six script styles and two sans serif styles.
                | Script styles include a ripple edged, smooth or rough version. The sans serif styles include a ripple edged or
                | rough version.
        .col-12.col-md-6.align-self-end.text-center
          img alt="minimo font" src="/assets/img/minimo.png"
          img alt="local brewery font" src="/assets/img/local-brewery.jpg"
  section.section.bg-gray
    .container
      header.section-header
        small LOGOTYPE
        h2 Logo variations
        hr
        p.lead
          | Amber has light & dark logos. Use the dark logo version
          | on lighter backgrounds & light version on multi-colored and dark backgrounds whenever the original
          | color of the logo doesn’t fit with the rest of the palette.
      .row.gap-5
        .col-12.col-md-4
          ul.nav.nav-vertical
            li.nav-item
              a.nav-link aria-expanded="false" data-toggle="tab" href="#tab-1"
                h6 Original
                p Always use the original logo when possible.
            li.nav-item
              a.nav-link.active aria-expanded="true" data-toggle="tab" href="#tab-2"
                h6 Inverse
                p Alternatively you can use the inverse version when possible.
            li.nav-item
              a.nav-link data-toggle="tab" href="#tab-3"
                h6 Light
                p Light version on multi-colored and dark backgrounds
            li.nav-item
              a.nav-link data-toggle="tab" href="#tab-4"
                h6 Dark
                p Use the dark logo version on lighter backgrounds.
        .col-12.col-md-8.align-self-center
          .tab-content.text-center
            #tab-1.tab-pane.fade
              .bg-img.logo-box-bg-white-amber
            #tab-2.tab-pane.fade.active.show aria-expanded="true"
              .bg-img.logo-box-bg-amber
            #tab-3.tab-pane.fade
              .bg-img.logo-box-bg-black
            #tab-4.tab-pane.fade
              .bg-img.logo-box-bg-white

  section.section
    .container
      .text-center.mb-70
        small COLOR SYSTEM
        h2 Primary & Complementary
        p
          | Amber has a palette of colors that consists of one primary color plus two shades.
          br
          | Consistent use of these colors will contribute to a cohesive and harmonious look.
      .row.gap-y
        .col-12.col-lg-3
          .card.card-inverse
            .card-block.primary-color
              h5.card-title Primary Color
              p.card-text HEX | #E67E25
              p.card-text Rgb | 230, 126, 37
              p.card-text HSL | 28, 79, 52
        .col-12.col-lg-3
          .card.card-inverse
            .card-block.lighter-shade
              h5.card-title Lighter Shade
              p.card-text HEX | #F0B480
              p.card-text Rgb | 240, 180, 128
              p.card-text HSL | 28, 79, 72
        .col-12.col-lg-3
          .card.card-inverse
            .card-block.darker-shade
              h5.card-title Darker Shade
              p.card-text HEX | #944D10
              p.card-text Rgb | 148, 77, 16
              p.card-text HSL | 28, 79, 32
        .col-12.col-lg-3
          .card.card-inverse
            .card-block.complementary-color
              h5.card-title Complementary Color
              p.card-text HEX | #258DE5
              p.card-text Rgb | 37, 141, 229
              p.card-text HSL | 208, 79, 52
