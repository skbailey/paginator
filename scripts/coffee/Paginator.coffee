###*
   * @class
   * @property {Array} itemList An list of items to paginate
   * @property {number} itemsPerPage The number of items to show on a page
   * @property {number} currentPageNumber The current page on display
###

class Paginator
    
    ###*
       * @global
       * @constructor 
       * @param {Object} options An object literal containing parameters
       * @example flightlist = new Paginator {itemList: arrayOfFlights, itemsPerPage: 5}
    ###
    constructor: (options) ->
        defaults = 
            itemList: []
            itemsPerPage: 5
        options = $.extend({}, defaults, options)
        
        ###* @default [] ####
        @itemList = options.itemList
        
        ###* @default 5 ####
        @itemsPerPage = options.itemsPerPage
        
        ###* @default 1 ####
        @currentPageNumber = 1
    
    ###*
       * Sets the itemList property
       * @memberOf Paginator
       * @function
       * @param {Array} newListOfItems An array of items to paginate
       * @example flightList.setItemList ["Jamaica", "Trinidad", "Barbados"]
    ### 
    setItemList: (newListOfItems) ->
        @itemList = newListOfItems
        
    ###*
       * Sets the itemsPerPage property
       * @memberOf Paginator
       * @function
       * @param {number} numberOfItemsPerPage The number of items to show on a page
       * @example flightList.setItemsPerPage 10
    ###
    setItemsPerPage: (numberOfItemsPerPage) ->
        @itemsPerPage = numberOfItemsPerPage
        
    ###*
       * Sets the currentPageNumber property
       * @memberOf Paginator
       * @function
       * @param {number} pageNumber Set the current page
       * @example flightList.setCurrentPageNumber 3
    ###
    setCurrentPageNumber: (pageNumber) ->
        @currentPageNumber = pageNumber
      
    ###*
       * Gets the itemList property
       * @memberOf Paginator
       * @function
       * @returns {Array} The array of items to paginate
       * @example flightList.getItemList()
    ###  
    getItemList: ->
        @itemList
        
    ###*
       * Gets the itemsPerPage property
       * @memberOf Paginator
       * @function
       * @returns {number} The number of items to show on a page
       * @example flightList.getItemsPerPage()
    ###
    getItemsPerPage: ->
        @itemsPerPage
        
    ###*
       * Gets the total number of pages
       * @memberOf Paginator
       * @function
       * @returns {number} The total number of pages for the list
       * @example flightList.getNumberOfPages()
    ###
    getNumberOfPages: ->
        Math.ceil(@getItemList().length / @getItemsPerPage())
        
    ###*
       * Gets the currentPageNumber property
       * @memberOf Paginator
       * @function
       * @returns {number} The current page on display
       * @example flightList.getCurrentPageNumber 3
    ###
    getCurrentPageNumber:  ->
        @currentPageNumber
        
    ###*
       * Gets a page of items
       * @memberOf Paginator
       * @function
       * @param {number} pageNumber The page to display
       * @returns {Array} The list of items on a page
       * @example flightList.getPage 3    
     ###
    getPage: (pageNumber) ->
        @setCurrentPageNumber(pageNumber)
        @itemList[((pageNumber - 1) * @itemsPerPage)...(pageNumber * @itemsPerPage)]
        
    ###*
       * Gets the current page of items
       * @memberOf Paginator
       * @function
       * @returns {Array} The list of items on the current page
       * @example flightList.getCurrentPage()   
     ###
    getCurrentPage: ->
        currentPage = @getCurrentPageNumber()
        @getPage(currentPage)
    
    ###*
       * Gets the next page of items
       * @memberOf Paginator
       * @function
       * @returns {Array|false} The list of items on the next page or false
       * @example flightList.getNextPage()   
     ###
    getNextPage: ->
        # If Paginator is on the last page, return false
        return false if @isLastPage()
            
        nextPageNumber = @getCurrentPageNumber() + 1
        @getPage(nextPageNumber)
    
    ###*
       * Gets the previous page of items
       * @memberOf Paginator
       * @function
       * @returns {Array|false} The list of items on the previous page or false
       * @example flightList.getPreviousPage()   
     ###
    getPreviousPage: ->
        # If Paginator is on the first page, return false
        return false if @isFirstPage()
            
        previousPageNumber = @getCurrentPageNumber() - 1
        @getPage(previousPageNumber)
        
    ###*
       * Checks if the Paginator is on the last page
       * @memberOf Paginator
       * @function
       * @returns {boolean} True, if the Paginator is on the last page.  False otherwise.
       * @example flightList.isLastPage()   
     ###
    isLastPage: ->
        @getCurrentPageNumber() is @getNumberOfPages()
        
    ###*
       * Checks if the Paginator is on the first page
       * @memberOf Paginator
       * @function
       * @returns {boolean} True, if the Paginator is on the first page.  False otherwise.
       * @example flightList.isFirstPage()   
     ###
    isFirstPage: ->
        @getCurrentPageNumber() is 1
        
window.SKB ?= {}
window.SKB.Paginator ?= Paginator