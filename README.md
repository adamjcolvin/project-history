# README

### Usage
You can find the app deployed on Heroku here. You can use either of these authentication details to log in:

Once you're logged in you're taken to a list of projects. Clicking on "Show Project" will take you to the project details with the conversation history underneath. 

You can click on "Edit Project" to update the state, and use the comment text box to add a comment. Both will then be displayed in the history. 

####User 1

**email**: adam@techtest.com

**password**: password

--

#### User 2 

**email**: homey@techtest.com

**password**: password

--



### Approach 
* The history needs to show both comments and state changes, so both of these are modelled with their own Active Record model. The Project model has an enumeration for the state, but any change to this will add a new StateChange record. This allows us know exactly what was changed, when it was changed and who changed it.  
* To show the comments and state together in the same history, I added another model called ProjectHistoryItem. This is a simple model with a polymorphic association to either a comment or a state change.
* This means that we can easily add more items to the history, say file attachments or deadlines for example. They could have their own data and styling but still be treated as history items. That makes things like sorting and filtering easier, as well as things like pagination, if we end up with very long histories. As well as things like sorting and indexing. 
* The Project page is also live, so any changes to the converstation history are streamed using Turbo Streams, meaning the page will update without a refresh being needed. 

### Tradeoffs
* I stuck with minitest for this, and the standard fixture files. For a larger project, or with more time, I'd be tempted to switch to RSpec and FactoryBot.

* I used [SimpleCSS](https://simplecss.org) for some basic styling around the generated pages. I added some very simple styling to comments and state
changes. I would have done more here given more time. 

### Assumptions
Based on the outline I was given, here are the questions I would have asked and the assumptions I've made.

I've also included these as seed data in the conversation history.

1. What states can a project be in? Is there a default state for a new project?

	*Assumption: For now, let's go with Planning, To Do, In Progress, Testing and Done. The default state should be Planning.*	
	
2. Should a project move through the states in a certain order, like transitioning from To Do to In Progress for example?
	
	*Assumption: Eventually we may want to enforce rules like that, but not for now.*
	
3. What does a project consist of? What details do we want to show about a project?
	
	*Assumption: The main focus will be on the project history, so some basic details like a project title and description will do for now.*

4. What about the UX for this feature? Where will the history sit within the project and what will this look like?
	
	*Assumption: Go with a list of items underneath the basic details of the project. The items should be listed in the order they were created.*

5. How do we want to paginate or lazy-load the history if there are lots of items?
	
	*Assumption: Build the solution with pagination in mind, but don't worry about implementing it for now.*

6. How about permissions? Do we only want to allow certain types of user to edit a project's state or add a comment?
	
	*Assumption: Eventually, we may only want to let the creator of the project edit the state, but for now we can just let any user make updates.*


7. Once a comment has been added, can it be edited or deleted?
	
	*Assumption: Eventually, comments can be edited or deleted by the author.*

8. Can comments be replied to?
	
	*Assumption: Eventually yes, but it's not necessary for the first version.*

9. Can other users be 'mentioned' in comments, using @<name> or something similar.
	
	*Assumption: Eventually yes, but not for this version.*


10. Should users be notified when a new comment is added? How do we do this and when?
	
	*Assumption: Commenters on the project could be notified by email when a new comment is added, but don't worry about this for now.*

