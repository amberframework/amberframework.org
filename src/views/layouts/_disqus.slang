#disqus_thread
javascript:
  // RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.
  // LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables
  var disqus_config = function () {
    this.page.url = "https://amberframework.org/#{filepath.to_s.sub(/.md$/, "")}"; // Replace PAGE_URL with your page's canonical URL variable
    this.page.identifier = "#{filepath}"; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
  };
  (function() { // DON'T EDIT BELOW THIS LINE
  var d = document, s = d.createElement('script');
  s.src = 'https://amberframework.disqus.com/embed.js';
  s.setAttribute('data-timestamp', +new Date());
  (d.head || d.body).appendChild(s);
  })();
noscript
  | Please enable JavaScript to view the
  a href="https://disqus.com/?ref_noscript"
    | comments powered by Disqus.
