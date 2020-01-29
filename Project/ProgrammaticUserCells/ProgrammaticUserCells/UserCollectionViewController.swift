import UIKit

class UserCollectionViewController: UIViewController {

    private var userView = UserCollectionView()
    var users = [User]() {
        didSet{
            userView.collectionView.reloadData()
        }
    }
    override func loadView() {
        view = userView
        

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userView.collectionView.delegate = self
        userView.collectionView.dataSource = self
        userView.collectionView.register(UINib(nibName: "UserCell", bundle: nil), forCellWithReuseIdentifier: "userCell")
    }
    
}

extension UserCollectionViewController: UICollectionViewDelegateFlowLayout {
    
}
extension UserCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "userCell", for: indexPath) as? UserCell else {
            fatalError("could not downcast as user cell")
        }
        let user = users[indexPath.row]
        cell.configureCell(for: user)
        return cell
    }
    
    
}
