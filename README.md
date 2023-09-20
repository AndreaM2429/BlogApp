<a name="readme-top"></a>
<div align="center">

  <h1><b>Blog App</b></h1>

</div>

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
    - [Tests](#tests)
- [💻 Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Setup](#setup)
  - [Usage](#usage)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [📝 License](#license)

# 📖 Blog App <a name="about-project"></a>

**Blog App** is the classic example of a blog website. This is a fully functional website that shows the list of posts and empower readers to interact with them by adding comments and liking posts.

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
<summary>Ruby</summary>
  <ul>
    <li>
      <a href="https://www.ruby-lang.org/es/">Ruby</a>
    </li>
  </ul>
</details>

<details>
<summary>Rails</summary>
  <ul>
    <li>
      <a href="https://guides.rubyonrails.org/">Guides</a>
    </li>
  </ul>
</details>

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

<summary>RSpec</summary>
  <ul>
    <li><a href="https://hackernoon.com/how-to-write-your-first-tests-using-rspec-in-rails-applications-hhfk2bqs">In Rails</a></li>
  </ul>
</details>

<details>
<summary>Linters</summary>
  <ul>
    <li><a href="https://github.com/microverseinc/linters-config/tree/master/ror">RoR linters</a></li>
  </ul>
</details>


### Key Features <a name="key-features"></a>

- **Migration files that create a database based on a [diagram](https://github.com/microverseinc/curriculum-rails/blob/main/blog-app/images/blog_app_erd_v1_1.png)**

- **Models for each of the tables in the database**

- **Methods that updates counters**

- **Methods that alows to select recent comments and posts**

- **RSpec unit test for the validations, associations and methods**


<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 💻 Getting Started <a name="getting-started"></a>

This repository includes files with Ruby lenguage.

### Prerequisites

In order to run this project you need to have install:
- Ruby check [this](https://www.ruby-lang.org/en/) to install it.
- Rails check [this](https://www.postgresql.org/) to install it.
- Postgresql check [this](https://guides.rubyonrails.org/) to install it.

### Setup

Clone this repository to your desired folder:

```sh
  cd my-folder
  git clone https://github.com/AndreaM2429/BlogApp
```

### Usage

You need to open the terminal and and navigate to the clone repository, run the commands to create the database and start the app:

```sh
  rails db:create
  rails db:migrate
  rails s
```
Navigate to http://localhost:3000 and see the functional app.

You can test the app from the terminal with:

```sh
  rails c
```
Try to run this commands and check the changes into your database.

```sh
  # Create users
  first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')

  # Create a post from one user
  first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')

  # Create a comment for the post
  Comment.create(post: first_post, author: second_user, text: 'Hi Tom!' )

  # Create a like for the post
  Like.create(user: first_user, post: first_post)
```

To check the linters you can use the command:

```sh
  rubocop
```

To fix the linter use: 

```sh
  rubocop --A
```

### Tests

To run the test use the command:

```sh
  bundle exec rspec
```

Or just `rspec`, additional you can specify the path of one specific file if you don't want to run all the tests.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



## 👥 Author <a name="authors"></a>

👤 **Andrea Manuel**
- GitHub: [@AndreaM2429](https://github.com/AndreaM2429)
- Twitter: [@AndreaManuelOr1](https://twitter.com/AndreaManuelOr1)
- LinkedIn: [Andrea Manuel](https://www.linkedin.com/in/andreamanuel24/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



## 🔭 Future Features <a name="future-features"></a>

- [ ] **Setup and controllers.**
- [ ] **Views.**
- [ ] **Forms.**
- [ ] **n+1 problems.**
- [ ] **Add Devise.**
- [ ] **Add authorization rules.**
- [ ] **Integration specs for Views.**
- [ ] **Add API endpoints.**
- [ ] **API documentation.**

<p align="right">(<a href="#readme-top">back to top</a>)</p>



## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>



## ⭐️ Show your support <a name="support"></a>

If you like this project you could clone the repo and work with it or do the changes in a new branch. Also you could let a message with your thoughts.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



## 🙏 Acknowledgments <a name="acknowledgements"></a>

I would like to thank Microverse for providing the necessary resources for this project.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>