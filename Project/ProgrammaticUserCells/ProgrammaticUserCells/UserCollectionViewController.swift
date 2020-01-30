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
        getUsers()
    }
    
    private func getUsers() {
        UsersFetchingService.manager.getUsers { [weak self] (result) in
            switch result {
            case .failure(let appError):
                print(appError)
            case .success(let users):
                self?.users = users
            }
        }
    }
    
}

extension UserCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSpacing: CGFloat = 10
        let maxSize: CGFloat = UIScreen.main.bounds.size.width
        let numberOfItems: CGFloat = 3
        //let itemWidth: CGFloat = maxSize.width * 0.40
        let totalSpace: CGFloat = numberOfItems * itemSpacing
        let itemWidth: CGFloat = (maxSize - totalSpace) / numberOfItems
        return CGSize(width: itemWidth, height: itemWidth)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
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
