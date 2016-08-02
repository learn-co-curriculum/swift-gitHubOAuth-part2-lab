# GitHub OAuth - Part II

## Objectives

 * Finish setting up the OAuth2 protocol to access a user's GitHub account

## Introduction

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

### 1. Add files to project
---
 * Add the following five files to this project from your completed version of the part one lab:
  * AppDelegate.swift
  * GitHubAPIClient.swift
  * Info.plist
  * LoginViewController.swift
  * Secrets.swift

![Copy Files Image](https://s3.amazonaws.com/learn-verified/gitHubOAuth-lab-copy-files.png)

### 2. Add OAuth methods to GitHubAPIClient
---
 * Add the following methods to the GitHubAPIClient extension marked "OAuth"

 ```swift
 // Start access token request process
 class func startAccessTokenRequest(url url: NSURL, completionHandler: (Bool) -> ()) {

 }

 // Save access token from request response to keychain
 private class func saveAccessTokenFrom(response response: String?, completionHandler: (Bool) -> ()) {

 }

 // Get access token from keychain      
 private class func getAccessToken() -> String? {

         return nil

 }

 // Delete access token from keychain
 class func deleteAccessToken(completionHandler: (Bool) -> ()) {

 }
 ```

### 3. Set up access token request
---
At the end of the last lab you received a temporary code back from GitHub. You are going to use that code to make a request to GitHub for the access token.
 * Inside the `safariLogin(_:)` method of the `LoginViewController`, call the `startAccessTokenRequest(url:completionHandler:)` method from the `GitHubAPIClient`.
 * Pass the URL received back from GitHub to the url parameter of the `startAccessTokenRequest(url:completionHandler:)` method.
  * *Hint:* Remember the notification argument passed in from `safariLogin(_:)` has the url stored in the object property.
 * Head over to the `GitHubAPIClient` class to define the `startAccessTokenRequest(url:completionHandler:)` method.
  * Use this order of tasks to define the method:
    * Use the `NSURL` extension from the `Extensions` file to extract the code.
    * Build your parameter dictionary for the request. The dictionary should contain:
      * "client_id": *your client id*
      * "client_secret": *your client secret*
      * "code": *temporary code from GitHub*
    * Use `request(_:_:parameters:encoding:headers:)` from [Alamofire](http://cocoadocs.org/docsets/Alamofire/3.4.1/Functions.html#/s:F9Alamofire7requestFTOS_6MethodPS_20URLStringConvertible_10parametersGSqGVs10DictionarySSPs9AnyObject___8encodingOS_17ParameterEncoding7headersGSqGS2_SSSS___CS_7Request) to make a POST request using the `.token` string from the `URLRouter` and the parameter dictionary.
    * If the request is successful, print the value of the response and call `completionHandler(true)`, else `completionHandler(false)`.
 * Run the application to see if you are getting a successful response.
