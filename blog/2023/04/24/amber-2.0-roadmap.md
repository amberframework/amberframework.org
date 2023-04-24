# Amber 2.0 Roadmap

Planning for Amber's future has been tough. There's a lot of questions I have had to ask myself and research to make decisions. Things such as:
- What kind of problems _need_ to be solved by a web framework?
- What aspects of Crystal outshine other languages that also have web frameworks?
- What weaknesses or inconveniences does Crystal introduce into the dev experience that need to be overcome or worked around?
- Where is the future workflow of web dev moving toward? (MORE javascript?1 😱)
- What kind of things have made other web frameworks successfully adopted and long lasting?


Well a few things from these questions have become obvious:

- Business is what drives adoption and long-term success of frameworks. (More business = more adoption)
- Crystals performance as a compiled language means scaling up radically faster and means far more forgiveness in coding optimizations.
- MVC is not a robust enough structure for most business models. Business logic should be separate from the database backed models to make testing easier, and boundaries clearer.
- Background job processing needs to be part of the workflow, not an after thought. Nearly all mature code bases introduce background jobs, so background jobs should be a first class citizen.
- Front-end asset pipelines need to be clearly defined. As I'm currently a Rails developer, going from the original asset pipeline in Rails 4 to the modern version of PYO (pick-your-own) asset pipeline and view rendering has made adopting Rails extremely difficult to newbies (particularly those new to coding). This should not be the case, Amber should have it's own asset pipeline that follows current conventions but does not require 3rd party assets to function as needed.
- AI powered development is steadily becoming the future, and I think it should be a first-class citizen as part of a developers tooling. Whether you're training your own version of Copilot or trying to create an LLM for managing your own documentation (internal or client facing), AI augmented development is the future. So, I want to introduce features that expand on the `docs` command that is already a great part of the Crystal language and introduce steps that make working with AI easier. By that I mean special markup that allows you to create AI training content from your code comments and the code base. The compiler already has to know a lot about how the code base works, so why not have an AI model that helps build your docs and makes it easier to ask questions about the code they want to write? 🤷‍♂️


## The Introduction to Amber 2.0


### The Ultimate Goal of Amber

To empower a solo developer to go from idea -> MVP -> Enterprise in record time, while following consistent conventions that easily scale all along the way. A smooth developer experience, with tooling that improves productivity for both writing and testing your application. A single developer should be able to build an app and run the business themselves.

As of now, Amber is not just a web framework, it is a business framework.


### Improving The Asset Pipeline

- Create our own front-end shard that handles sass with the dart-ass VM tool
- Create our shard that handles JS using import maps, making it easier to write our own minimal JS
- Create a shard to handle dynamic pages using server-side-rendering (SSR) like in Phoenix.(potentially using WASM)
- Create a cleaner and clearer interface for using a JS framework for your front-end
- Better/easier image linking for image assets.

### Improving Background Job Processing

- Make a clear interface for triggering (aka enqueueing) background jobs.
- By default we'll wrap MosquitoCR for background job processing, but this will be modular and allow for dropping in different background processors as needs change over time.
- Background jobs now go into `app/jobs/background`
- Cron jobs now go into `app/jobs/cron`

### Improving How Business Logic Is Handled (Organizationally)

- Business logic models and database backed models in the same folder is a code smell. On small apps this works fine, but it quickly gets out of hand and boundaries get too blurry to manage which leads to unnecessary tech debt from not having a good pattern from the beginning.
- MVC is also not inclusive of background jobs or other complexities that are added in during a maturing apps growth, it just assumes all business logic is the same (a web request) but that's rarely true. Background jobs have a different flow from web requests, typically in how they are triggered but also how they are managed in general (timed job, long-running, batched jobs, cron jobs, etc).
- Amber is introducing two new code sections:
	- `app/domain` this is where you business logic goes. It's intended to have the parent portion of the process begin in the root folder, with it's child objects name spaced into sub folders that are named as part of the process.
	- `app/services` this is where you put service objects. This is for reusable objects that are helpful, but not specific to your business logic. Things like clients for API's you have to interact with, data transformers, etc. We've all had to write service objects for things like this and in most web frameworks they don't have a place, but now in Amber they do.

### Improving Developer Productivity

I come from a Rails background (primarily) and one of the things I love about Rails is how extensible it's own tasks are. That's much harder to do with Crystal apps because CLI tools are compiled binaries, so making it extendable by being able to add tasks to the tool inherently means re-compiling the CLI tool and that's not a smooth experience.

- Introduce a new `.amber/templates` folder that the CLI tool checks for templates of documentation/classes that are used for the generators.
- Introduce a yml and json markup language that let's the developer redefine existing generators with templates customized for their apps workflow. This includes hooking into existing generators to add things like test files with customizations that you know may need to be repeated (or factories for models, test objects, etc.)
- Ensure that the Amber core framework can be run using Crystals `interpreter` mode to avoid having to compile during development entirely. Once the app grows this may not be entirely possible, but it should start out that way.
- Improving documentation on ways to deploy an Amber app out into "the wild" (aka production).

### Making AI A First-Class Citizen

AI tooling is becoming more and more popular, so we should lean into that. There are several parts of the development process where AI can be used:

1. During the development process. 
2. Creating documentation, public and private.
3. Creating training material for public documentation that can be used for public AI models like ChatGPT.

- Amber will have up to date documentation created and trained on Copilot and ChatGPT for the current release. Training material for v1.3.2 is still currently being developed from the existing help documentation. Once 2.0 is released, this will be part of the typical release cycle.
- Amber will introduce a new feature as part of the CLI tool called `aitraining` that will use a combination of code comment documentation (like the current `docs` command) to generate training material for an LLM.
- Amber will also introduce it's own version of the `docs` command that will create public documentation that can be release version specific. The Crystal api is pretty good about having API docs available for each release, let's take that to the next level and enable you (the dev) to create public docs including tutorials/instructions from your code base.

More to come as this is still in early planning stages, but I expect this aspect will move fast.

### Improving the ORM (Granite)

Granite is currently the default ORM that ships with Amber. I had originally intended on replacing it with Jennifer, however I've decided to back peddle on this decision. There are a handful of reasons for this:

1. I want the default ORM to be as close to feature parity (including config files, schema file, migrations and model methods, etc.) to ActiveRecord as possible.
2. Granite is a little less full-featured than Jennifer, however the changes required to bring Granite up to feature parity with ActiveRecord are easier than refactoring an existing code base.
3. I want to create a gem that allows a strangler pattern to be used on a Rails app to create an Amber app. Having the ORM entirely under the control of the Amber org is going to be critical in helping make this smooth and _maintainable_.
4. I want to use as much of the original foundation as possible for the framework to respect it's original creators and the time they put into this framework.

The specifics for Granite will be handled in the repo itself using the issues tracker. 

### Improving the CLI tool

The Amber CLI tool currently ships with the Amber framework as a monorepo. This makes development of the framework aspects bluried with the CLI tool, and it makes testing changes a bit weird. Since the CLI tool is going to be far more robust, it just makes sense to have the framework code itself separate. I already created a repo and have begun working on this, however it's still very early.


### Wrapping up

Thanks for reading this far along! If you want to participate, please make sure to star the Amber repo and join the [discord](https://discord.gg/vwvP5zakSn)!