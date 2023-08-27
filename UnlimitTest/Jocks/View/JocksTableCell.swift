//
//  JocksTableCell.swift
//  UnlimitTest
//
//  Created by Sachin Yadav on 26/08/23.
//

import UIKit

final class JocksTableCell: UITableViewCell {
    
    private let jokelabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.numberOfLines = 0
        label.textColor = .systemMint
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.numberOfLines = 0
        label.textColor = .systemGray
        return label
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI(){
        selectionStyle = .none
        contentView.addSubview(timeLabel)
        contentView.addSubview(jokelabel)
        
        jokelabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        jokelabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        jokelabel.bottomAnchor.constraint(equalTo: timeLabel.topAnchor, constant: 0).isActive = true
        jokelabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        
        timeLabel.leftAnchor.constraint(equalTo: jokelabel.leftAnchor).isActive = true
        timeLabel.rightAnchor.constraint(equalTo: jokelabel.rightAnchor).isActive = true
        timeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true

    }
    
    func configureData(joke: Joke){
        jokelabel.text = joke.text
        timeLabel.text = joke.date.formatted()
    }
}
