krumsws
=======

The web service component of Krums. This service accepts and returns JSON representations of Krums objects.

The nouns in the service are:

* Product
* Backlog
* Archive
* UserStory
* Task
* AcceptanceCriterion

Home
----

	GET http://127.0.0.1/krumsws

returns

	{
		"products": "http://127.0.0.1/krumsws/products"
	}

Product
-------

	GET http://127.0.0.1/products

returns

	[
		{
			"name": "Krums-iPhone",
			"product": "http://127.0.0.1/krumsws/products/krums-iphone"
		},
		{
			"name": "krumsws",
			"product": "http://127.0.0.1/krumsws/products/krumsws"
		}
	]

E.g.

	GET http://127.0.0.1/krumsws/products/krums-iphone

returns

	{
		"name": "Krums-iPhone",
	    "description": "An iPhone client for a crummy Scrum tool.",
		"defaultSprintWeeks": 2,
		"backlog": "http://127.0.0.1/krumsws/products/krums-iphone/backlog",
		"archive": "http://127.0.0.1/krumsws/products/krums-iphone/archive"
	}

Backlog
-------

E.g.

	GET http://127.0.0.1/krumsws/products/krums-iphone/backlog

returns

	{
		"product": "http://127.0.0.1/krumsws/products/krums-iphone",
		"stories": [
			"http://127.0.0.1/krumsws/products/krums-iphone/stories/krums-4",
			"http://127.0.0.1/krumsws/products/krums-iphone/stories/krums-5",
			"http://127.0.0.1/krumsws/products/krums-iphone/stories/krums-1",
			"http://127.0.0.1/krumsws/products/krums-iphone/stories/krums-2"
		]
	}

Archive
-------

E.g.

	GET http://127.0.0.1/krumsws/products/krums-iphone/archive

returns

	{
		"product": "http://127.0.0.1/krumsws/products/krums-iphone",
		"stories": [
			"http://127.0.0.1/krumsws/products/krums-iphone/stories/krums-4",
			"http://127.0.0.1/krumsws/products/krums-iphone/stories/krums-5",
			"http://127.0.0.1/krumsws/products/krums-iphone/stories/krums-1",
			"http://127.0.0.1/krumsws/products/krums-iphone/stories/krums-2"
		]
	}

User Story
----------

E.g.

	GET http://127.0.0.1/krumsws/products/krums-iphone/stories/krums-4

returns

	{
		"product": "http://127.0.0.1/krumsws/products/krums-iphone",
		"storyPoints": 13,
		"text": "As a user, I'd like something, so that I have it.",
		"acceptanceCriteria": [
			"http://127.0.0.1/krumsws/products/krums-iphone/stories/krums-4/criteria/krums-4-1",
			"http://127.0.0.1/krumsws/products/krums-iphone/stories/krums-4/criteria/krums-4-2",
			"http://127.0.0.1/krumsws/products/krums-iphone/stories/krums-4/criteria/krums-4-3"
		]
		"tasks": [
			"http://127.0.0.1/krumsws/products/krums-iphone/stories/krums-4/tasks/krums-4-1",
			"http://127.0.0.1/krumsws/products/krums-iphone/stories/krums-4/tasks/krums-4-2",
			"http://127.0.0.1/krumsws/products/krums-iphone/stories/krums-4/tasks/krums-4-3",
			"http://127.0.0.1/krumsws/products/krums-iphone/stories/krums-4/tasks/krums-4-4"
		]
	}

Acceptance Criterion
--------------------

E.g.

	GET http://127.0.0.1/krumsws/products/krums-iphone/stories/krums-4/criteria/krums-4-1

returns

	{
		"story": "http://127.0.0.1/krumsws/products/krums-iphone/stories/krums-4",
		"accepted": false,
		"text": "Does the feature work?"
	}

Task
----

E.g.

	GET http://127.0.0.1/krumsws/products/krums-iphone/stories/krums-4/tasks/krums-4-1

returns

	{
		"story": "http://127.0.0.1/krumsws/products/krums-iphone/stories/krums-4",
		"estimate": "1d",
		"text": "Do something."
	}

Riak
====

Riak will be used as the data store.

MapReduce
---------

Example of using MapReduce to pull out all products.

	curl -v -d '{"inputs":"products", "query":[{"map":{"language":"javascript","source":"
	function(v) {
	  return [v.values[0].data];
	}
	"}}]}' -H "Content-Type: application/json" http://127.0.0.1:8091/mapred
