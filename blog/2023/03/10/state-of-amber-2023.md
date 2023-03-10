# Future Vision For Amber

Amber is a staple web framework in the Crystal community, often times it is one of the first frameworks new and exploring future Crystalists come across. This first interaction with the Crystal language and Amber needs to be smooth and easy. I believe that the lower the friction of getting started combined with comfortable and familiar work flows will help drive adoption of both Crystal and Amber.

For the most part, Amber has been fairly stable over the last couple of years. This is a huge testament to the original creators and maintainers of this beautiful framework. From the bottom of my heart, thank you all for having done such a great job. 

During 2022 I made a few quality of life improvements, mostly around how Webpack chose to install javascript dependencies, to continue making the initial setup experience smooth. This has worked out well with the latest v1.3.2 having the conveniences of adding in conveniences like discovering your terminals username and adding that info into your database configuration instead of requiring the user to perform these setup steps before being able to run `amber watch`.

So this leads me to a question I've been thinking about for nearly the last year: where do we go with Amber from here?

## Where Do We Go With Amber From Here?

Personally I'm a big picture planner. I like looking at the zoomed out plan over a long period. I'm a firm believer that a clear long-term vision brings stability, predictability and productivity to a group or community. So where do we go? Well, let's take a look at what other mature and excellent web frameworks have in common:

- Asset management (think plain/vanilla javascript, SCSS/CSS, images, etc.)
- Persistance layers (the `M` in `MVC`)
- View/response rendering (part of the `V` in `MVC`)
- Controllers/Routing (the `C` in `MVC`, but not necessarily from `MVC`)
- Authentication
- Background job processing, or atleast an interface for triggering background jobs
- Developer productivity tools (think: generators, scaffolding, db migration management, testing helpers, etc.)
- Good, clear documentation

One other really big feature that deliniates successful and largely adopted frameworks is: business need. How fast can someone with little-to-no knowledge go from idea -> product? Does the framework allow that business to grow? Is there information showing how the framework is a good business decision?

When you look at it from this big picture perspective there are two paths that begin to present themselves are parallel to one another and simultaneously critical for success:

- Business needs
- Technical needs

It's where these two parallel roads insect that makes adoption and use of a framework increase.

## Intersecting Business and Technical Needs Going Forward

Going forward there are some core philosophies I'm going to adopt for Amber.

1. Amber will require no outside resources to build and run your application. This means no more 3rd party shards being part of Amber. Yes this means less modularity, but instead of swapping shards we'll provide the configuration information necessary to enable/disable built-in features. 

2. Amber will embrace a specific setup and style of development. This is critical, because currently I'm the only core maintainer and I can't maintain multiple workflows that I don't use. Productivity comes from clarity and focus, this is currently not the case. The focus going forward will be around "native" or non-containerized development out of the box. Of course, you can still containerize your app and I'll even help provide some docs on how to do it, but it won't be provided out of the box.

3. Amber will focus on server-side rendering for views. By default, there will be no javascript transpilers/compilers/builder tools shipping with Amber. This ecosystem is just too vast. I'll do my best to make interfacing with your JS transpiler/compiling/bundler/etc. of choice, but I can't provide any guarantees.

4. Amber docs will provide clear developer workflows for being as productive as possible. Your personal productivity is still critical.

5. Amber new feature development will focus on business need first. This means it has to have a universal business benefit to be part of the framework. "Universal" in this sense means big picture features like automatic database connection switching for sharding, or background job processing.

6. Amber will focus on getting businesses started using Amber. This means enhancing information on how to get your app deployed out into the world and how the different Amber features rapidly develop business features. Expect screen casts in the future!

7. Amber will create a release schedule with time frames for maintaining previous releases. This is somethig that isn't currently done for Amber, but all mature frameworks provide this. This is core to providing stability and predictability that businesses need.

## What This Means For Amber Development

Going forward, I'm going to freeze the currently released version to v1.3.2. I will do a security release if a security issue comes to light, the version will then become v.1.3.2.x for any security releases.

The `master` branch will continue to have the latest updates on it, but you can reasonably expect breaking changes as we move toward a v2.0. As the big changes are made I'll continue to make blog posts about it, so you'll be fully informed on new/experimental features to test out. I'll also add a road map explaining the changes that are coming once I finish mapping the order of things to happen.

Cheers,

Seth Tucker
