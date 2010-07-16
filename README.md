krumsws
=======

The web service component of Krums. This service accepts and returns JSON representations of Krums objects.

The nouns in the service are:

* Product
* UserStory
* Task
* AcceptanceCriterion

API
---

E.g.

	GET /products/krums-iphone

returns

	{
		"name" : "Krums-iPhone",
		"productDescription" : "An iPhone client for a crummy Scrum tool.",
		"defaultSprintWeeks" : 2
	}
