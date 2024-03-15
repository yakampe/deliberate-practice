# Deliberate Practice Repository

This is a personal project born from a passion for adopting best practices and gamifying my learning experience.  
The idea sprouted from a desire to have a more organised 
approach to skill enhancement, accompanied by the motivation of seeing progress through summary statistics – offering
those small dopamine hits that make the journey that slight amount more enjoyable.

### What is deliberate practice

> Ericsson et al (1993) used the term deliberate practice for the individualized 
> training activities especially designed by a coach or teacher to improve specific
> aspects of an individual’s performance through repetition and successive refinement.
> To receive maximal benefit from feedback, individuals have to monitor their training
> with full concentration, which is effortful and limits the duration of daily training.

_Ericsson, Karl & Lehmann, Andreas. (1996). Expert and Exceptional Performance: Evidence of Maximal Adaptation to Task Constraints. Annual review of psychology. 47. 278_

### Role of deliberate practice

> An important reason for the weak relation between experience and performance is that many of our most common activities,
> such as work and competitions, play and leisure, afford few opportunities 
> for effective learning and improvement of skill.

_Ericsson, Karl & Lehmann, Andreas. (1996). Expert and Exceptional Performance: Evidence of Maximal Adaptation to Task Constraints. Annual review of psychology. 47. 278_

## Purpose

This repository serves a dual purpose:
1. **Facilitating Deliberate Practice**: By offering templates for various scenarios, it allows users to concentrate on honing specific skills within a structured framework. This targeted practice is crucial for mastery and overcoming plateaus in learning curves.
2. **Tracking Progress Over Time**: Leveraging GitHub branches and GitHub actions enables users to maintain a detailed history of their practice sessions. This not only aids in monitoring progress but also provides easy access to revisit and reflect on past work.

## How it works

1. Fork repository
2. Clone forked repository
3. Select the template by running `./practice start`
4. Complete the challenge 
5. Run `./practice accept`
6. Check out `SUMMARY.MD` file
7. Repeat practice until mastery

### Detailed Getting Started Information

1. **Select a Practice Template**: To begin a practice session, run the script with the `start` action:
`./practice.sh start` This will present a list of available templates. Enter the number corresponding to the template you wish to use, and the script will check out a new branch for your practice session.

2. **Complete Your Practice**: Once you've selected a template and the new branch is checked out, you can start your deliberate practice.

3. **Accepting Your Practice**: After completing your practice, run:
`./practice.sh accept`
4. This command will mark your practice as completed. The script adds statistics to a `summary.md` file in the main branch, which includes a history of results with links to the branches where practices were accepted, timestamps, and tracks the progress of completed practices. This updating is performed using GitHub Actions.

## Tracking Progress

The `summary.md` file in the main branch serves as a dashboard for your practice journey. This will be generated after 
you first accept a practice and the GitHub Action Workflow has run.

## Call for Collaboration

We welcome contributions to this project! Whether you have suggestions for new templates, improvements to the script, or enhancements to the practice tracking mechanism, your input can help make this tool more beneficial for everyone.

### How to Contribute

- **Submit Templates**: Share templates that have helped you or might help others in their practice journey.
- **Enhance the Script**: Propose improvements or add new features to `practice.sh` to make the practice sessions more seamless.
- **Improve Documentation**: Help refine this README and other documentation to make the repository more user-friendly.

## Getting Involved

To contribute, please follow the standard GitHub fork and pull request workflow. If you have ideas or proposals, feel free to open an issue to discuss them with the community.