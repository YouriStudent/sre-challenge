# Warpnet SRE Challenge

Welcome to the Site Reliability Engineering (SRE) challenge, where your SRE skills will be put to the test. You'll
deploy an application in both a traditional and Kubernetes environment, showcasing your ability to orchestrate complex
systems. From defining Kubernetes manifests to fixing bugs and ensuring good observability, this challenge mirrors
real-world scenarios encountered by our SREs. Whether you're a seasoned professional or a newcomer eager to explore
complex cloud environments, this challenge offers platform to demonstrate your expertise.

## Instructions

Your goal is to deploy the included Python application directly in a local Kubernetes cluster. The application may
contain some bugs and vulnerabilities.

## Objectives

In this challenge, you'll navigate through a series of objectives designed to assess your proficiency as an SRE. Each
objective is crafted to highlight specific aspects of your skills.

- Functionality
- Simplicity
- Readability
- Extensibility
- Maintainability
- Observability
- Security

As you embark on the SRE challenge, we want to emphasize that the objective is not to stress about achieving perfection
on every front. Our primary goal is to gain insights into you current skillset and problem-solving approach within the
realm of Site Reliability Engineering. Recognize that the challenge may be multifaceted, and it's perfectly acceptable
to prioritize certain objectives over others. This challenge is an opportunity for you to demonstrate your existing
skills and learning, providing valuable insights into your capabilities as an SRE professional.

## Challenge

A lot of enterprise organizations make the transition from traditional virtual machines to deployments in a Kubernetes
based infrastructure.
Automation, security, architecture, quality of code are main subjects during this transition. This challenge is all
about simulating that. There are a three main assignments that you need to do during this challenge:

- Deploy the app on a traditional VM.
- Look into the application code and make adjustments that you think are necessary.
- Deploy the app on a Kubernetes environment.

You are free to choose which tools and methods you use during this challenge. Keep in mind that you should show the
listed aspects under [Objectives](#objectives) in your solution.

## Tips and tricks

Below you'll find a few quick tips to get your environment up and running. If you are more comfortable using other kind
of tools, feel free to use them!

- [Vagrant](https://www.vagrantup.com/): a tool that allows you to quickly setup a dev environment based on virtual
  machines.
- [MiniKube](https://minikube.sigs.k8s.io/docs/): in general Kubernetes requires a lot of resources, MiniKube helps you
  setting up a local cluster on your workstation.

> The testing credentials are still admin/supersecret

## Challenge #1: Deploy the app on a traditional VM.

To spinup the machine you need to install the following programs on your local machine:

- [Virtualbox](https://www.virtualbox.org/wiki/Downloads)
- [Vagrant](https://developer.hashicorp.com/vagrant/install?product_intent=vagrant)

The following plugin needs to be installed by running the command:

`vagrant plugin install vagrant-env`

>Before starting the VM you first need te create a `.env` file based on the `template.env`

Start the VM by running `vagrant up`

Now you are all set browse the application like you would normally, using the following url: http://localhost:5000

## Challenge #2: Look into the application code and make adjustments that you think are necessary.

The following things are improved to make the app more secure:

- The passwords and other configs are moved to an environment variable.
- There is a Captcha added to the login.
- Added CSRF tokens to the login.
- The select query to select a user from the database has been optimized.
- Sensitive values like passwords are removed from the application output.
- Made sure that the session cookies are not readable by JS.
- Hash and salt the passwords inside the database.

## Challenge #3: Deploy the app on a Kubernetes environment.

>Before starting the Docker container you first need te create a `.env` file based on the `template.env`
> 
Due to the lack of knowledge and time (because of school) I have only managed to create the Docker containers needed for
the kubernetes cluster. To simply start the Docker container you can use `docker compose up` this will start the
application at http://localhost:5600.

## Get Involved

[Explore open jobs at Warpnet](https://warpnet.nl/jobs/) or take a look at
our [featured projects](https://github.com/warpnet). Visit [warpnet.nl](https://warpnet.nl/) to learn more!
