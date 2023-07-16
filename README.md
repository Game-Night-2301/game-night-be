<a name="readme-top"></a>

<!-- PROJECT SHIELDS -->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/RentInform/BE-Rent-Inform">
    <img src="https://user-images.githubusercontent.com/120869196/253766698-18414249-a92b-4b58-9032-ac67ce3b26b0.png" alt="Logo" >
  </a>

<h3 align="center">Game Night</h3>

  <p align="center">
    Welcome to the back-end repository for Game Night <br /> Game Night is a web application built for the Turing School of Software and Design's Mod 4 Capstone project. Read more about project requirements: https://mod4.turing.edu/projects/capstone/
    <br />
  </p>
</div>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li><a href="#getting-started">Getting Started</a></li>
    <li><a href="#testing">Testing</a></li>
    <li><a href="#db-design">DB Design</a></li>
    <li><a href="#endpoint">Endpoint</a></li>
    <li><a href="#technical-solutions">Technical Solutions</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->
## About The Project

Game Night is an app designed for organizing and scheduling board game get-togethers. Users can create a board game event based on the games in their collection, and join games happening near them.

Game night is an excellent way to take the hassle out of scheduling get-togethers with your friends, and acts as means of meeting new people who share your passion for tabletop gaming.

- [Production Website](https://game-night-fe.vercel.app/)
- Backend can be accessed using using `graphQL` queries to the following URL: https://game-night-backend-172o.onrender.com/graphql
- Github repositories:
  * Front End: [![Github][Github]][project-fe-gh-url]
  * Back End: [![Github][Github]][project-be-gh-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Built With:

* [![Ruby][Ruby]][Ruby-url]
* [![Rails][Rails]][Rails-url]
* [![PostgreSQL][Postgres]][Postgres-url]
* [![Github_Actions]][GHA_url]
* <img src="https://user-images.githubusercontent.com/120869196/253420930-fa40df17-082f-4cb4-92a2-97986e1cd676.png" width="85" height="28"/>
* <img src="https://user-images.githubusercontent.com/120869196/253767245-15d1faeb-4585-4b7a-adba-33d42190a172.jpg" witdth="auto" height="28"/>
* <img src="https://user-images.githubusercontent.com/116964982/238382095-7d4a3eeb-c907-4e1c-b8cf-abf6b8c20c6e.png"/>
* <img src="https://img.shields.io/badge/Postman-FF6C37?style=for-the-badge&logo=postman&logoColor=white"/>
* <img src="https://user-images.githubusercontent.com/120869196/253767662-710a07ce-2cee-41e1-8c4e-ade25a38f86d.png" width="auto" height="28"/>


Game Night's back-end application uses these integrations:
* [OpenAI](https://platform.openai.com/docs/introduction)
* [Board Game Atlas](https://www.boardgameatlas.com/api/docs)
* [Geocoder](https://github.com/alexreisner/geocoder/blob/master/README.md)

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- GETTING STARTED -->
## Getting Started

To demo Game Night on your local machine, follow these steps: 

### Back End Repository

1. Get a free Board Game Atlas API Key [here](https://www.boardgameatlas.com/signup)
2. Register for an OpenAI API Key [here](https://platform.openai.com/overview)
3. Clone this repo `git@github.com:Game-Night-2301/game-night-be.git`
4. Navigate to the local repository: `cd game-night-be`
5. Run: `bundle install`
6. Run: `rails db:{drop,create,migrate,seed}`
7. Run: `bundle exec figaro install`
8. Add `BOARD_GAME_ATLAS_CLIENT_ID` and `OPENAI_ACCESS_TOKEN` to `config/application.yml` file
9. Run: `rails s` to start the Rails server
10. Visit: http://localhost:3000/graphiql


### Front End Repository
1. Clone the front end [here](https://github.com/Game-Night-2301/game-night-fe)
2. Follow instructions in the front-end repo `README`

### Prerequisites
- Ruby Version 3.1.1
- Rails Version 7.0.5

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- Testing -->
## Testing
 
`bundle exec rspec` will run the entire test suite. *All tests are passing at the time of writing. At above 98% coverage*

The team tested happy paths, sad paths, and edge cases when needed. Error responses were added where applicable. 


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- DB Design -->
## DB Design
 
 <img src="https://user-images.githubusercontent.com/120869196/253768623-2ce6305e-bd65-49d5-a87b-5d0199824f3c.png" alt="Schema" width="100%">
 
<p align="right">(<a href="#readme-top">back to top</a>)</p>


## Endpoint

### graphQL Queries

#### Get a User
``` 
  query {
          user(id: 1 ) {
            id
            username
            password
            city
            state
            lat
            lon
            attendingEvents {
              id
            }
            hostedEvents {
              id
            }
            recommendedGames {
              id
              name
              minPlayers
              maxPlayers
              minPlaytime
              maxPlaytime
              description
              imageUrl
              averageUserRating
              averageStrategyComplexity
            }
          }
        }
  ```
#### Get Events

  ```
query {
  event(id: 1) {
    id
    date
    address
    state
    city
    zip
    title
    cancelled
    description
    hostId
    game
    gameType
    playerCount
    startTime
    endTime
    lat
    lon
    full
    distanceFrom
    gameDetails {
      id
      name
      minPlayers
      maxPlayers
      minPlaytime
      maxPlaytime
      description
      imageUrl
      averageUserRating
      averageStrategyComplexity
    }
    host {
      id
      username
    }
    attendees {
      id
      username
    }
  }
}
```



#### Get Games
```
query {
  games {
    id
    name
    minPlayers
    maxPlayers
    minPlaytime
    maxPlaytime
    description
    imageUrl
    averageUserRating
    averageStrategyComplexity
  }
}
```


#### Get Random Game
```
query {
  randomGame {
     id
     name
     minPlayers
     maxPlayers
     minPlaytime
     maxPlaytime
     description
     imageUrl
     averageUserRating
     averageStrategyComplexity
  }
}
```
### graphQL Mutations


#### Create Event
```
mutation {
  createEvent(input: {
    date: "2023/11/7",
    address: "123 This street",
    state: "Colorado",
    city: "Denver",
    zip: 15555,
    title: "Grandma's basement",
    description: "We'll be playing caracasonne for 9 hours",
    host: 4744564,
    game: 97833646,
    gameType: "board game",
    startTime: "10:00",
    endTime: "12:00"
  }) {
    event {
      id
    }
  }
}
```

#### Create User Event
```
mutation {
  createUserEvent(input: {
      userId: 1
      eventId: 8
  }) 
  {
    userEvent {
      id
      userId
      eventId
      event {
        id
        date
        address
        state
        city
        zip
        title
        cancelled
       description
        hostId
        game
        gameType
        playerCount
        attendees {
          id
          username
        }
        }
      }
    }
  }
```

#### Create User Game
```
mutation {
            createUserGame(input: {
              userId: 1
              gameId: 2000
            }) {
              userGame {
                id
                userId
                gameId
                newGame {
                  name
                  minPlayers
                  maxPlayers
                  minPlaytime
                  maxPlaytime
                  description
                  imageUrl
                  averageUserRating
                  averageStrategyComplexity
                }
              }
            }
          }
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- Technical Solutions -->
## Technical Solutions


WRITE SOME PARAGRAPHS ABOUT STRETCH TECH, OPENAI, ETC...

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ROADMAP -->
## Roadmap

Additional features, functionality, and potential refactors:
* User Authentication
  * Google OAuth and/or Board Game Atlas OAuth
* Cache external API calls to improve performance
* Consume additional external API to expand beyond just tabletop games to video games and alike
  * Set up functionality to organize and plan, similar to board game nights:
    * Video Game tournaments
    * LAN Parties
    * TTRPG Sessions

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- CONTACT -->
## Contact

### Back-end Team

| [<img alt="Dyson Breakstone" width="100" src="https://user-images.githubusercontent.com/120869196/253776345-1471e248-ddc1-461b-aeee-d8ac4d59bba4.jpeg"/>](https://www.linkedin.com/in/dyson-breakstone-4978291a2/) | [<img alt="Brian Guthrie" width="100" src="https://user-images.githubusercontent.com/120869196/253776434-25807eec-dbb2-49f8-a1fd-3fda117a3685.png"/>](https://www.linkedin.com/in/brian-guthrie-1bba73232/) | [<img alt="Stephen McPhee" width="100" src="https://user-images.githubusercontent.com/120869196/253780562-bdea39b0-2222-448b-bdb3-83f47804a79c.jpg"/>](https://www.linkedin.com/in/smcphee19/) |
| ------------------ | ------------ | ---------------- | 
| Dyson Breakstone | Brian Guthrie | Stephen McPhee |
| Back-end Developer | Back-end Developer | Back-end Developer |
| [GitHub](https://github.com/DysonBreakstone) | [GitHub](https://github.com/Brianisthebest) | [GitHub](https://github.com/SMcPhee19) |
| [LinkedIn](https://www.linkedin.com/in/dyson-breakstone-4978291a2/) |  [LinkedIn](https://www.linkedin.com/in/brian-guthrie-1bba73232/) | [LinkedIn](https://www.linkedin.com/in/smcphee19/) |

<br>

### Front-end Team

| [<img alt="Ashlee Webb" width="100" src="https://user-images.githubusercontent.com/120869196/253776976-0bae2ece-d4c5-4272-a584-b0353fbc6302.jpeg"/>](https://www.linkedin.com/in/ashlee-webb/) | [<img alt="Adriane Sutherland" width="100" src="https://user-images.githubusercontent.com/120869196/253777040-2a305d4d-c3f4-427d-a2d0-6d345b628f86.jpeg"/>](https://www.linkedin.com/in/adriane-sutherland/) | [<img alt="Trey Marshall" width="100" src="https://user-images.githubusercontent.com/120869196/253777102-92b26459-2e10-497c-91f2-7bb784de7d66.png"/>](https://www.linkedin.com/in/tdmars/) | [<img alt="John Featherstone" width="100" src="https://user-images.githubusercontent.com/120869196/253777161-8d90b254-594f-4178-8ac1-5699ccbe38ce.jpeg"/>](https://www.linkedin.com/in/john-w-featherstone/) |
| ------------ | ------------------ | ------------- | ----------------- |
| Ashlee Webb | Adriane Sutherland | Trey Marshall | John Featherstone |
| Front-end Developer | Front-end Developer | Front-end Developer | Front-end Developer |
| [GitHub](https://github.com/AshleeAWebb) | [GitHub](https://github.com/asutherland91) | [GitHub](https://github.com/tdmburr) | [GitHub](https://github.com/JWFeatherstone) |
| [LinkedIn](https://www.linkedin.com/in/ashlee-webb/) | [LinkedIn](https://www.linkedin.com/in/adriane-sutherland/) | [LinkedIn](https://www.linkedin.com/in/tdmars/) | [LinkedIn](https://www.linkedin.com/in/john-w-featherstone/) |

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
[contributors-shield]: https://img.shields.io/github/contributors/Game-Night-2301/game-night-be.svg?style=for-the-badge
[contributors-url]: https://github.com/Game-Night-2301/game-night-be/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/Game-Night-2301/game-night-be.svg?style=for-the-badge
[forks-url]: https://github.com/Game-Night-2301/game-night-be/network/members
[stars-shield]: https://img.shields.io/github/stars/Game-Night-2301/game-night-be.svg?style=for-the-badge
[stars-url]: https://github.com/Game-Night-2301/game-night-be/stargazers
[issues-shield]: https://img.shields.io/github/issues/Game-Night-2301/game-night-be.svg?style=for-the-badge
[issues-url]: https://github.com/Game-Night-2301/game-night-be/issues
[license-shield]: https://img.shields.io/github/license/Game-Night-2301/game-night-be.svg?style=for-the-badge
[license-url]: https://github.com/Game-Night-2301/game-night-be/blob/main/LICENSE.txt
[linkedin]: https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white
[stephen-li-url]: https://www.linkedin.com/in/smcphee19/
[Ruby]: https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white
[Ruby-url]: https://www.ruby-lang.org/en/
[Rails]: https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white
[Rails-url]: https://rubyonrails.org/
[Postgres]: https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white
[Postgres-url]: https://www.postgresql.org/
[Github_Actions]: https://img.shields.io/badge/GitHub_Actions-2088FF?style=for-the-badge&logo=github-actions&logoColor=white
[GHA_url]: https://docs.github.com/en/actions
[Github]: https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white
[project-fe-gh-url]: https://github.com/Game-Night-2301/game-night-fe
[project-be-gh-url]: https://github.com/Game-Night-2301/game-night-be
[stephen-gh-url]: https://github.com/SMcPhee19
