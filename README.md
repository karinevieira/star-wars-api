# Star Wars API

Building an API using Ruby on Rails 6.

<table>
  <tr>
    <td>Ruby Version</td>
    <td>2.5.8</td>
  </tr>
  <tr>
    <td>Rails Version</td>
    <td>6.0.4.6</td>
  </tr>
  <tr>
    <td>Database</td>
    <td>PostgreSQL</td>
  </tr>
</table>

## Installation

```bash
  # clone the project
  git clone https://github.com/karinevieira/star-wars-api.git

  # enter the cloned directory
  cd star-wars-api

  # run the project
  docker-compose up --build

  # create the development and test databases
  rails db:create

  # migrate tables to database
  rails db:migrate
```
Open the browser at the address http://localhost:3000 

## Running Tests

To run tests, run the following command

```bash
  rspec
```

## API Reference

#### Endpoints

| Endpoints                 | Usage                                  | Params                                          |
|---------------------------|----------------------------------------|-------------------------------------------------|
| ``GET /api/planets``           | Get all of the planets.                 |                                                 |
| ``GET /api/planets?name=term`` | Get all planets with name like term.    | term: [String]                                  |
| ``GET /api/planets/:id``       | Get details of a single planet.         |                                                 |
| ``POST /api/planets``          | Create a new planet.                    | name: [String], weather: [String], ground: [String] |
| ``PUT /api/planets/:id``       | Edit the details of an existing planet. | name: [String], weather: [String], ground: [String] |
| ``DELETE /api/planets/:id``    | Remove the planet.                      |                                                 |
