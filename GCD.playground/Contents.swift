import UIKit
// Dispatch Queues
/**
 Serial:- Execute one task at a time
 Concurrent:- One or more task concurrently run, Task completing according to complexity and not by the order
 */

/**
 GCD -> Grand central dispatch
    Add task to dispatch queues so GCD can decide which thread to execute
        worked on FIFO
 */

/**
 Main Discpatch Queue :- It use for UI updation
 Glabal Queues :- It executes one or more task concurrently but stil keeps it FIFO order of excecution
 Custom Queues:- create which can be serial or concurrent. Requests in these queues actually end up in one of the global queues.
 
 QOS Classes
     UserInteractive -> This should run on main thread
    UserInitiated->HIGH-> Asynchronus Task from UI , Use this when user waiting results and task which are required to contiue user interaction
    Utitlity->Low Priority->Prefereed for indicator which is visible data fetching and computation
    background-> Lowes priority
 
 
 */

/**
 Sync -> It works one by one
 Async-> It starts the task and return immediately it does not wait task to complete
 */


/**
    Dispatch barriers -> All work prior to diapatch barrier are guaranteed to complete before dispatch work item will excute
 
    Dispatch Groups -> We can create task multiple task either wait for them to complete or recieve a notofication when they complete
 */

//-----------------------------------------------------------------------------------------
/// Working with System Task

DispatchQueue.main.async {
    // Asynchronous code running on the main queue
}

DispatchQueue.global(qos: .utility).async {
    // Asynchronous code running on the low priority queue
}

DispatchQueue.global(qos: .userInitiated).sync {
    // Synchronous code running on the high prioriy queue
}

DispatchQueue(label: "name of Custom Queue").async {
  // You can do something such as transforming an image.
  //self.doSomething()
  DispatchQueue.main.async {
    // You can do something such as setting the transformed image to ImageView.
    //self.doSomething()
  }
}

// Barrier
let queue = DispatchQueue(label: "sampleBarrier",attributes: .concurrent)

queue.async(flags: .barrier) {
  print("I am the only item to be executed.")
}

// Groups
// Create a group
let dispatchGroup = DispatchGroup()
let queue1 = DispatchQueue(label: "sampleQueue1")
let queue2 = DispatchQueue(label: "sampleQueue2")
let queue3 = DispatchQueue(label: "sampleQueue3")
// Put all queues into dispatchGroup
queue1.async(group: dispatchGroup) {
  print("Queue1 complete.")
}
queue2.async(group: dispatchGroup) {
  print("Qqueue2 complete.")
}
queue.async(group: dispatchGroup,flags: .barrier) {
  print("I am Holding the queue.")
}
queue3.async(group: dispatchGroup) {
  print("Queue3 complete.")
}
// After the queues in dispatchGroup are all done, back to the main thread
dispatchGroup.notify(queue: DispatchQueue.main) {
  print("All tasks are done.")
}
