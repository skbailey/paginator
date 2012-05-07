describe "Paginator", ->

    beforeEach ->
        @paginator = new window.SKB.Paginator
            itemList: [1..15]
            itemsPerPage: 5
        
    describe "when instantiated", -> 
    
        it "should contain an 'itemList' property", ->
            (expect @paginator.itemList).toBeDefined()
            (expect @paginator.itemList).toEqual [1..15]
            
        it "should contain an 'itemsPerPage' property", ->
            (expect @paginator.itemsPerPage).toBeDefined()
            
        it  "should contain a 'currentPageNumber' property", ->
            (expect @paginator.currentPageNumber).toBeDefined()
    
    describe "setters/getters", ->
        
        it "should set the 'itemList' property", ->
            @paginator.setItemList([1, 2, 3])
            (expect @paginator.itemList).toEqual [1, 2, 3]
            
        it "should set the 'itemsPerPage' property", ->
            @paginator.setItemsPerPage(9)
            (expect @paginator.itemsPerPage).toEqual 9
            
        it "should set the 'currentPageNumber' property", ->
            @paginator.setCurrentPageNumber(3)
            (expect @paginator.currentPageNumber).toEqual 3
            
        it "should get the 'itemList' property", ->
            @paginator.setItemList([1..5])
            (expect @paginator.getItemList()).toEqual [1..5]
            
        it "should get the 'itemsPerPage' property", ->
            @paginator.setItemsPerPage(12)
            (expect @paginator.getItemsPerPage()).toEqual 12
            
        it "should get the 'currentPageNumber' property", ->
            @paginator.setCurrentPageNumber(2)
            (expect @paginator.getCurrentPageNumber()).toEqual 2
            
    describe "pages", ->
        
        beforeEach ->
            @paginator = new window.SKB.Paginator
                itemList: [1...34]
                itemsPerPage: 6
                
        it "should get the total number of pages", ->
            (expect @paginator.getNumberOfPages()).toEqual 6
                
        it "should get a page by number", ->
            (expect @paginator.getPage(1)).toEqual [1..6]
            (expect @paginator.getPage(3)).toEqual [13..18]
                
        it "should change the currentPageNumber when getting a page", ->
            @paginator.setCurrentPageNumber(2)
            @paginator.getPage(4)
            (expect @paginator.getCurrentPageNumber()).toEqual 4
            
        it "should get the current page", ->
            @paginator.setCurrentPageNumber(2)
            (expect @paginator.getCurrentPage()).toEqual [7..12]
            
        it "should get the previous page", ->
            @paginator.setCurrentPageNumber(2)
            (expect @paginator.getPreviousPage()).toEqual [1..6]
            
        it "should get the next page", ->
            @paginator.setCurrentPageNumber(2)
            (expect @paginator.getNextPage()).toEqual [13..18]
            
        it "should decrement the currentPageNumber when it gets the previous page", ->
            @paginator.setCurrentPageNumber(2)
            @paginator.getPreviousPage()
            (expect @paginator.getCurrentPageNumber()).toEqual 1
            
        it "should increment the currentPageNumber when it gets the next page", ->
            @paginator.setCurrentPageNumber(2)
            @paginator.getNextPage()
            (expect @paginator.getCurrentPageNumber()).toEqual 3
            
        it "should not get the previous page if on the first page", ->
            @paginator.setCurrentPageNumber(1)
            (expect @paginator.getPreviousPage()).toBeFalsy()
            
        it "should not get the next page if on the last page", ->
            @paginator.setCurrentPageNumber(6)
            (expect @paginator.getNextPage()).toBeFalsy()
            
        it "should be truthy if on the first page", ->
            @paginator.setCurrentPageNumber(1)
            (expect @paginator.isFirstPage()).toBeTruthy()
            
        it "should be truthy if on the last page", ->
            @paginator.setCurrentPageNumber(6)
            (expect @paginator.isLastPage()).toBeTruthy()
            
        it "should be falsy if NOT on the first page", ->
            @paginator.setCurrentPageNumber(3)
            (expect @paginator.isFirstPage()).toBeFalsy()
            
        it "should be falsy if NOT on the last page", ->
            @paginator.setCurrentPageNumber(3)
            (expect @paginator.isLastPage()).toBeFalsy()