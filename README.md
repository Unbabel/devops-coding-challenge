# MultiVAC

This project is part of the [Unbabel](https://unbabel.com/) selection process for the DevOps position.
The full challenge description can be found [here](./resources/docs/proposals/challenge.md).

### Context

A multi-purpose self-adjusting and self-correcting computer called MultiVAC is being developed to help us understand how to reverse the universe's [entropy](https://en.wikipedia.org/wiki/Entropy).

If you're confusing with the description above, see the [reference](#reference).

### Application Overview

Our MultiVAC is currently in the form of a single application that uses a ***Web API*** through ***HTTP*** with a limited number of ***Endpoints***.

The MultiVAC can anwser only one question:
```
* How can the entropy of the universe be reversed?
```

To do that, the user can perform two possible actions:
```
* Add new data
* Ask the question
```

***Endpoint mapping***

| Function          | Method | Endpoint       | Body Params         |
|-------------------|:-------|:---------------|:-------------------:|
| Add new data      |  POST  | /multivac/data | data: String (form) |
| Ask the question  |  GET   | /multivac      |     -               |

***App Architecture***

```
* Flask Server
* Worker Machines
* Redis Server
* MongoDB
```

For a more detailed infomation, see the [Design Proposal](./resources/docs/proposals/design.md).

> **Note**: The design proposal addresses the challenge [***Planning***](./docs/proposals/challenge.md#planning) phase.

### Running MultiVAC

You can [run the MultiVAC locally](./resources/docs/tutorials/run-locally.md).

It is also possible to [deploy MultiVAC in a Kubernetes cluster](./resources/docs/tutorials/run-on-kubernetes.md).

There are tutorials to [seting up a CI system](./resources/docs/tutorials/ci.md) and [debuging](./resources/docs/tutorials/debuging.md) too.

> **Note**: This section addresses the challenge [***Execution***](./docs/proposals/challenge.md#execution) phase.

### Reference

"The Last Question" is a science fiction short story by American writer Isaac Asimov.

The story deals with the development of a series of computers that helps humans to colonize the universe.

Are you curious? see the [full text](http://www.multivax.com/last_question.html).

_____

Thank you for reading,

Feel free to send any question or suggestion: artmr@lsd.ufcg.edu.br
