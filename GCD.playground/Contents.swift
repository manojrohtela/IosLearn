import UIKit
//// Dispatch Queues
///**
// Serial:- Execute one task at a time
// Concurrent:- One or more task concurrently run, Task completing according to complexity and not by the order
// */
//
///**
// GCD -> Grand central dispatch
//    Add task to dispatch queues so GCD can decide which thread to execute
//        worked on FIFO
// */
//
///**
// Main Discpatch Queue :- It use for UI updation
// Glabal Queues :- It executes one or more task concurrently but stil keeps it FIFO order of excecution
// Custom Queues:- create which can be serial or concurrent. Requests in these queues actually end up in one of the global queues.
// 
// QOS Classes
//     UserInteractive -> This should run on main thread
//    UserInitiated->HIGH-> Asynchronus Task from UI , Use this when user waiting results and task which are required to contiue user interaction
//    Utitlity->Low Priority->Prefereed for indicator which is visible data fetching and computation
//    background-> Lowes priority
// 
// 
// */
//
///**
// Sync -> It works one by one
// Async-> It starts the task and return immediately it does not wait task to complete
// */
//
//
///**
//    Dispatch barriers -> All work prior to diapatch barrier are guaranteed to complete before dispatch work item will excute
// 
//    Dispatch Groups -> We can create task multiple task either wait for them to complete or recieve a notofication when they complete
// */
//
////-----------------------------------------------------------------------------------------
///// Working with System Task
//
//DispatchQueue.main.async {
//    // Asynchronous code running on the main queue
//}
//
//DispatchQueue.global(qos: .utility).async {
//    // Asynchronous code running on the low priority queue
//}
//
//DispatchQueue.global(qos: .userInitiated).sync {
//    // Synchronous code running on the high prioriy queue
//}
//
//DispatchQueue(label: "name of Custom Queue").async {
//  // You can do something such as transforming an image.
//  //self.doSomething()
//  DispatchQueue.main.async {
//    // You can do something such as setting the transformed image to ImageView.
//    //self.doSomething()
//  }
//}
//
//// Barrier
//let queue = DispatchQueue(label: "sampleBarrier",attributes: .concurrent)
//
//queue.async(flags: .barrier) {
//  print("I am the only item to be executed.")
//}
//
//// Groups
//// Create a group
//let dispatchGroup = DispatchGroup()
//let queue1 = DispatchQueue(label: "sampleQueue1")
//let queue2 = DispatchQueue(label: "sampleQueue2")
//let queue3 = DispatchQueue(label: "sampleQueue3")
//// Put all queues into dispatchGroup
//queue1.async(group: dispatchGroup) {
//  print("Queue1 complete.")
//}
//queue2.async(group: dispatchGroup) {
//  print("Qqueue2 complete.")
//}
//queue.async(group: dispatchGroup,flags: .barrier) {
//  print("I am Holding the queue.")
//}
//
//queue.async(group: dispatchGroup,flags: .assignCurrentContext) {
//  print("I am Holding the queue. assignCurrentContext")
//}
//queue.async(group: dispatchGroup,flags: .detached) {
//  print("I am Holding the queue. detached")
//}
//queue.async(group: dispatchGroup,flags: .noQoS) {
//  print("I am Holding the queue. noQoS")
//}
//
//queue.async(group: dispatchGroup,flags: .enforceQoS) {
//  print("I am Holding the queue. enforceQoS")
//}
//queue3.async(group: dispatchGroup) {
//  print("Queue3 complete.")
//}
//// After the queues in dispatchGroup are all done, back to the main thread
//dispatchGroup.notify(queue: DispatchQueue.main) {
//  print("All tasks are done.")
//}
//
//
//
//
//
//let Serialqueue1 = DispatchQueue(label: "First")
//
//let Serialqueue2 = DispatchQueue(label: "Second")
//
//
//let Serialqueue3 = DispatchQueue(label: "Third")
//
//
//let Serialqueue4 = DispatchQueue(label: "Fourth")
//
//
//let Serialqueue5 = DispatchQueue(label: "Fifth")
//
//DispatchQueue.main.async {
//    Serialqueue1.async {
//        print("First")
//    }
//    Serialqueue2.async {
//        print("Second")
//    }
//    Serialqueue3.async {
//        print("Third")
//    }
//    Serialqueue4.async {
//        print("Fourth")
//    }
//    Serialqueue5.async {
//        print("Fifth")
//    }
//}
//
//
//let semaphore = DispatchSemaphore(value: 0)
//DispatchQueue.global().async {
//    print("waiting for at least one signal")
//    //wait for a signal
//    semaphore.wait()
//    print("At least one signal has been received")
//}
//
//DispatchQueue.global().async {
//    sleep(2)
//    print("calling signal")
//    //send the signal
//    semaphore.signal()
//}
//
//
//let dw = DispatchWorkItem {
//    print("Dispatch work item is working")
//}
//
//let dq = DispatchQueue(label: "custom dispatch Queue")
//dq.async(execute: dw)
//
//DispatchQueue.main.async(group: dispatchGroup, qos: .userInitiated, flags: .barrier) {
//    
//}
//
//DispatchQueue.global(qos: .userInteractive).async {
//    print(1)
//}
//
//DispatchQueue.global(qos: .userInitiated).async {
//    print(2)
//}
//
//DispatchQueue.global(qos: .utility).async {
//    print(3)
//}
//
//DispatchQueue.global(qos: .background).async {
//    print(4)
//}
//
//DispatchQueue.global(qos: .default).async {
//    print(5)
//}
//
//
//DispatchQueue.global().async {
//    for i in 1...5 {
//        print("global async \(i)")
//    }
//}
//DispatchQueue.global().async {
//    for i in 1...5 {
//        print("global async 2 \(i)")
//    }
//}


let testQue = DispatchQueue(label: "sdfs")


testQue.async {
    print("bbbbb")
}
testQue.sync {
    print("aaaaaaa")
}


    print("ccccc")

struct Member{
    var address:String
    mutating func modifyAddress(addr: String){
        address = addr
    }
}


var memeber = Member(address: "Dadar")
memeber.modifyAddress(addr: "sdhjfgds")
print(memeber.address)

