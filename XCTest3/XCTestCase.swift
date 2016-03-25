//===--- XCTestCase.swift -----------------------------------------------------===//
//Copyright (c) 2016 Daniel Leping (dileping)
//
//Licensed under the Apache License, Version 2.0 (the "License");
//you may not use this file except in compliance with the License.
//You may obtain a copy of the License at
//
//http://www.apache.org/licenses/LICENSE-2.0
//
//Unless required by applicable law or agreed to in writing, software
//distributed under the License is distributed on an "AS IS" BASIS,
//WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//See the License for the specific language governing permissions and
//limitations under the License.
//===----------------------------------------------------------------------===//

import XCTest

#if swift(>=3.0)
#else
    /*!
     * @category AsynchronousTesting
     *
     * @discussion
     * This category introduces support for asynchronous testing in XCTestCase. The mechanism
     * allows you to specify one or more "expectations" that will occur asynchronously
     * as a result of actions in the test. Once all expectations have been set, a "wait"
     * API is called that will block execution of subsequent test code until all expected
     * conditions have been fulfilled or a timeout occurs.
     */
    public extension XCTestCase {
        
        
        /*!
         * @method -expectationWithDescription:
         *
         * @param description
         * This string will be displayed in the test log to help diagnose failures.
         *
         * @discussion
         * Creates and returns an expectation associated with the test case.
         */
        @objc(expectation:)
        public func expectation(withDescription description: String) -> XCTestExpectation {
            return self.expectationWithDescription(description)
        }
        
        
        /*!
         * @typedef XCWaitCompletionHandler
         * A block to be invoked when a call to -waitForExpectationsWithTimeout:handler: times out or has
         * had all associated expectations fulfilled.
         *
         * @param error
         * If the wait timed out or a failure was raised while waiting, the error's code
         * will specify the type of failure. Otherwise error will be nil.
         */
        
        /*!
         * @method -waitForExpectationsWithTimeout:handler:
         *
         * @param timeout
         * The amount of time within which all expectations must be fulfilled.
         *
         * @param handler
         * If provided, the handler will be invoked both on timeout or fulfillment of all
         * expectations. Timeout is always treated as a test failure.
         *
         * @discussion
         * -waitForExpectationsWithTimeout:handler: creates a point of synchronization in the flow of a
         * test. Only one -waitForExpectationsWithTimeout:handler: can be active at any given time, but
         * multiple discrete sequences of { expectations -> wait } can be chained together.
         *
         * -waitForExpectationsWithTimeout:handler: runs the run loop while handling events until all expectations
         * are fulfilled or the timeout is reached. Clients should not manipulate the run
         * loop while using this API.
         */
        
        @objc(waitForExpectations:handler:)
        public func waitForExpectations(withTimeout timeout: NSTimeInterval, handler: XCWaitCompletionHandler? = nil) {
            self.waitForExpectationsWithTimeout(timeout, handler: handler)
        }
        
        
        /*!
         * @method -keyValueObservingExpectationForObject:keyPath:expectedValue:
         *
         * @discussion
         * A convenience method for asynchronous tests that use Key Value Observing to detect changes
         * to values on an object. This variant takes an expected value and observes changes on the object
         * until the keyPath's value matches the expected value using -[NSObject isEqual:]. If
         * other comparisions are needed, use the variant below that takes a handler block.
         *
         * @param objectToObserve
         * The object to observe.
         *
         * @param keyPath
         * The key path to observe.
         *
         * @param expectedValue
         * Expected value of the keyPath for the object. The expectation will fulfill itself when the
         * keyPath is equal, as tested using -[NSObject isEqual:]. If nil, the expectation will be
         * fulfilled by the first change to the key path of the observed object.
         *
         * @return
         * Creates and returns an expectation associated with the test case.
         */
        
        public func keyValueObservingExpectation(for objectToObserve: AnyObject, keyPath: String, expectedValue: AnyObject?) -> XCTestExpectation {
            return self.keyValueObservingExpectationForObject(objectToObserve, keyPath: keyPath, expectedValue: expectedValue)
        }
        
        
        /*!
         * @typedef
         * A block to be invoked when a change is observed for the keyPath of the observed object.
         *
         * @param observedObject
         * The observed object, provided to avoid block capture issues.
         *
         * @param change
         * The KVO change dictionary.
         *
         * @return
         * Return YES if the expectation is fulfilled, NO if it is not.
         */
        
        /*!
         * @method -keyValueObservingExpectationForObject:keyPath:handler:
         *
         * @discussion
         * Variant of the convenience for tests that use Key Value Observing. Takes a handler
         * block instead of an expected value. Every KVO change will run the handler block until
         * it returns YES (or the wait times out). Returning YES from the block will fulfill the
         * expectation. XCTAssert and related APIs can be used in the block to report a failure.
         *
         * @param objectToObserve
         * The object to observe.
         *
         * @param keyPath
         * The key path to observe.
         *
         * @param handler
         * Optional handler, /see XCKeyValueObservingExpectationHandler. If not provided, the expectation will
         * be fulfilled by the first change to the key path of the observed object.
         *
         * @return
         * Creates and returns an expectation associated with the test case.
         */
        
        public func keyValueObservingExpectation(for objectToObserve: AnyObject, keyPath: String, handler: XCKeyValueObservingExpectationHandler? = nil) -> XCTestExpectation {
            return self.keyValueObservingExpectationForObject(objectToObserve, keyPath: keyPath, handler: handler)
        }
        
        
        /*!
         * @typedef
         * A block to be invoked when a notification matching the specified name is observed
         * from the object.
         *
         * @param notification
         * The notification object.
         *
         * @return
         * Return YES if the expectation is fulfilled, NO if it is not.
         */
        
        /*!
         * @method -expectationForNotification:object:handler:
         *
         * @discussion
         * A convenience method for asynchronous tests that observe NSNotifications.
         *
         * @param notificationName
         * The notification to register for.
         *
         * @param objectToObserve
         * The object to observe.
         *
         * @param handler
         * Optional handler, /see XCNotificationExpectationHandler. If not provided, the expectation
         * will be fulfilled by the first notification matching the specified name from the
         * observed object.
         *
         * @return
         * Creates and returns an expectation associated with the test case.
         */
        
        @objc(expectation:object:handler:)
        public func expectation(forNotification notificationName: String, object objectToObserve: AnyObject?, handler: XCNotificationExpectationHandler? = nil) -> XCTestExpectation {
            return self.expectationForNotification(notificationName, object: objectToObserve, handler: handler)
        }
        
        
        /*!
         * @typedef
         * Handler called when evaluating the predicate against the object returns true. If the handler is not
         * provided the first successful evaluation will fulfill the expectation. If provided, the handler can
         * override that behavior which leaves the caller responsible for fulfilling the expectation.
         */
        
        /*!
         * @method -expectationForPredicate:evaluatedWithObject:handler:
         * Creates an expectation that is fulfilled if the predicate returns true when evaluated with the given
         * object. The expectation periodically evaluates the predicate and also may use notifications or other
         * events to optimistically re-evaluate.
         */
        
        public func expectation(for predicate: NSPredicate, evaluatedWith object: AnyObject, handler: XCPredicateExpectationHandler? = nil) -> XCTestExpectation {
            return self.expectationForPredicate(predicate, evaluatedWithObject: object, handler: handler)
        }
    }
    
    /// Measurement extension
    public extension XCTestCase {
        /*!
         * @method -measureBlock:
         *
         * Call from a test method to measure resources (+defaultPerformanceMetrics) used by the
         * block in the current process.
         
         - (void)testPerformanceOfMyFunction {
         
         [self measureBlock:^{
         // Do that thing you want to measure.
         MyFunction();
         }];
         }
         
         * @param block A block whose performance to measure.
         */
        public func measure(block: () -> Swift.Void) {
            self.measureBlock(block)
        }
        
        
        /*!
         * @method -measureMetrics:automaticallyStartMeasuring:forBlock:
         *
         * Call from a test method to measure resources (XCTPerformanceMetrics) used by the
         * block in the current process. Each metric will be measured across calls to the block.
         * The number of times the block will be called is undefined and may change in the
         * future. For one example of why, as long as the requested performance metrics do
         * not interfere with each other the API will measure all metrics across the same
         * calls to the block. If the performance metrics may interfere the API will measure
         * them separately.
         
         - (void)testMyFunction2_WallClockTime {
         [self measureMetrics:[[self class] defaultPerformanceMetrics] automaticallyStartMeasuring:NO forBlock:^{
         
         // Do setup work that needs to be done for every iteration but you don't want to measure before the call to -startMeasuring
         SetupSomething();
         [self startMeasuring];
         
         // Do that thing you want to measure.
         MyFunction();
         [self stopMeasuring];
         
         // Do teardown work that needs to be done for every iteration but you don't want to measure after the call to -stopMeasuring
         TeardownSomething();
         }];
         }
         
         * Caveats:
         * • If YES was passed for automaticallyStartMeasuring and -startMeasuring is called
         *      anyway, the test will fail.
         * • If NO was passed for automaticallyStartMeasuring then -startMeasuring must be
         *      called once and only once before the end of the block or the test will fail.
         * • If -stopMeasuring is called multiple times during the block the test will fail.
         *
         * @param metrics An array of NSStrings (XCTPerformanceMetrics) to measure. Providing an unrecognized string is a test failure.
         *
         * @param automaticallyStartMeasuring If NO, XCTestCase will not take any measurements until -startMeasuring is called.
         *
         * @param block A block whose performance to measure.
         */
        
        public func measureMetrics(metrics: [String], automaticallyStartMeasuring: Bool, for block: () -> Swift.Void) {
            self.measureMetrics(metrics, automaticallyStartMeasuring: automaticallyStartMeasuring, forBlock: block)
        }
    }
#endif
