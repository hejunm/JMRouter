# JMRouter

## What is it?

Router is an iOS routing SDK used to implement communication between modules. Main advantages:

* Support URL routing based on JLRouter;
* Support code routing, parameter and return value support type checking;
* Use Swift to achieve;

## Start
### Define Router Node
```
open class RouterNodeParamBase {
    public var paramDic: [String: Any]?
    required public init() {}
}

public protocol RouterNodeDefineAble: AnyObject {
    associatedtype ParamType: RouterNodeParamBase
    associatedtype ReturnType
    static var identifier: String { get }
    static var urlPattern: String? { get }
}

/// In RouterDefine Module
public class RouterNodeDefineModuleAPage1: RouterNodeDefineAble {
    public typealias ParamType = RouterNodeParamBase
    public typealias ReturnType = UIViewController
    static var identifier: String? = "RouterNodeDefineModuleAPage1"
    public static let urlPattern: String? = "/module_a/page1_link/"
}
```

### Implement Router Node

```
public protocol RouterNodeImpAble: NSObject {
    associatedtype NodeDefineType: RouterNodeDefineAble
    static func regist()
    static func createDestination(param: NodeDefineType.ParamType?) -> NodeDefineType.ReturnType?
}

/// In ModuleA
@objc(ModuleAPage1Router)
public class ModuleAPage1Router: NSObject, RouterNodeImpAble {
    public typealias NodeDefineType = RouterNodeDefineModuleAPage1
    
    @objc
    public static func regist() {
        self.registNodeDefine()
    }
    
    public static func createDestination(param: RouterNodeParamBase?) -> UIViewController? {
        let vc = [[ModuleAPage1ViewController alloc] init];
        vc.param = param;
        return vc;
    }
}

/// In .h file of ModuleA.  After Regist, ModuleAPage1Router.regist() will be called when app launch.
RouterNodeRegist(ModuleAPage1Router)
```

### Router To ModuleAPage1 from other Module
```
/// In Module2
/// Type 1
RouterNodeDefineModuleAPage1.openPage(paramFactory: { param in
    param.paramDic = ["source": "Module2"]
}, type: nil)

/// Type 2
if let vc = RouterNodeDefineModuleAPage1.createDestination(paramFactory: { param in 
    param.paramDic = ["source": "Module2"] }) {
    self.navigationController?.pushViewController(vc, animated: true)
}

/// Type 3
Router.share.openPage(url: URL(string: "scheme://module_a/page1_link?source=Module2"))
```

### License
BSD 3-clause. See the LICENSE file for details.

