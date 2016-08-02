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
