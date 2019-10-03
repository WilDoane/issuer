# issuer: Local issue tracking, no net required

The goal of issuer is to provide a simple issue tracker, hosted on your local file system, for those users who don't want to or are disallowed from using cloud-based code repositories.

Online code repositories often provide an issue tracker to allow developers, reviewers, and users to report bugs, submit feature requests, and so on. However, many developers either choose to work offline or work on enterprise networks where use of cloud services may be prohibited.

issuer is an Addin for use in RStudio's desktop IDE. It works entirely locally with no requirement for a cloud service or even a network connection.

After installing the package, you'll have several new menu items in the Addins menu:

* Open Issue
* Close Issue
* List Issues
* Goto Issue Source
* Search Issues
* Delete Closed Issues

In the style of [Notational Velocity](http://notational.net/), issues are stored as plain text [Markdown](https://daringfireball.net/projects/markdown/basics) files in a dedicated `issuer/` folder within your RStudio project.

## Version Control your Issues (optional)

You can commit these issues to your local [Git](https://git-scm.com/) repository. Git is version control software that works locally on your file system to store a history of changes made to your project files. Use of Git does not require a network connection or use of a cloud account.

While Git is *often* used with [Github](https://github.com/) or another cloud-based, online, remote repository, Git can be--- and is by default--- a local-only version control tool.

## Installation

You can install the development version of issuer from [Github](https://github.com/WilDoane/issuer) with:

``` r
devtools::install_guthub("WilDoane/issuer")
```

## Workflow

In your typical workflow, you create an RStudio project in which you create one or more R Scripts. As you work, you have ideas for new features to be added; notice bugs that need to be addressed; and have brilliant insights about how to refactor your code to improve efficiency, structure, and expressiveness. (You do... right...?)

Currently, you may keep a separate text file with notes to yourself or you markup your source code with `# TODO` annotations.

With issuer, you can quickly make individual plain text/Markdown notes.

While viewing a source code file, activate `Open Issue`. You'll be asked to provide a title for the new issue. Once provided, a .md file will be created, saved in `issuer/open/`, and opened in the source editor for you to expound upon by providing a [reproducible example](https://stackoverflow.com/help/minimal-reproducible-example). When done, save and close the note.

At any time, you can activate `List Issues` for a complete list of open and closed issues. You can also `Search Issues` using a [regular expression](https://medium.com/factory-mind/regex-tutorial-a-simple-cheatsheet-by-examples-649dc1c3f285). In either case, an RStudio markers panel will appear, similar to when you use `Edit > Find in Files...`. The panel will list the issue titles with open issues appearing above closed issues. Double-clicking any of the items will open the .md issue.

While viewing any issue, activating `Goto Issue Source` will jump to the source code file and line number that was active when the issue was created.

While viewing an open issue, activating `Close Issue` will move the open issue's .md file to the `issuer/closed/` folder and will update the marker panel.

If you'd like to clean up old, closed issues, activate `Delete Closed Issues`. I don't assign a keyboard shortcut for this becuase it's a destructive process and use of it is rare. If you haven't by this point used Git to commit your issues files to your local or remote repository, then the closed, deleted issues will be permenently lost. 

## Suggested Key Bindings

Using RStudio's `Tools > Modify Keyboard Shortcuts...`, I typically 
assign the following keystrokes to the issuer addin items.


Addin Item            | Mac Binding       | Windows Binding  | Note
--------------------- | ----------------- | ---------------- | --------------
Open Issue            | CMD OPTION =      | ALT WIN =        | Conceptually, "+" for add
Close Issue           | CMD OPTION -      | ALT WIN -        |
List Issues           | CMD OPTION L      | ALT WIN L        |
Goto Issue Source     | CMD OPTION G      | ALT WIN G        | If you can. Otherwise H.
Search Issues         | CMD OPTION S      | ALT WIN S        |
Delete Closed Issues  |                   |                  | No shortcut assigned



