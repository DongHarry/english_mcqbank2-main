package com.example.english_mcqbank.service;

import com.example.english_mcqbank.model.UserEntity;
import com.example.english_mcqbank.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class UserDetailsServiceImpl implements UserDetailsService, IUserService {
    private final UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserEntity user = this.getUserByUsername(username);

        if (user == null) {
            throw new UsernameNotFoundException("User not found");
        }

        //System.out.println("User: " + user.getUsername() + " " + user.getPassword() + " " + user.isEnabled() + " " + Arrays.toString(user.getRoles()));

        return new org.springframework.security.core.userdetails.User(
                user.getUsername(),
                user.getPassword(),
                user.isEnabled(),
                true,
                true,
                true,
                AuthorityUtils.createAuthorityList(user.getRoles()));
    }

    @CachePut(value = "userCache", key = "'userByName'+#username")
    public UserEntity getUserByUsername(String username) {
        return userRepository.findByUsername(username).orElse(null);
    }

    @CacheEvict(value = "userCache", allEntries = true)
    public void deleteUserByUsername(String username) {
        UserEntity user = userRepository.findByUsername(username).orElse(null);
        if (user != null) {
            userRepository.delete(user);
        }
    }

    @Cacheable(value = "userCache")
    public List<UserEntity> getAllUsers() {
        return userRepository.findAll();
    }

    public Boolean isUserPresent(String username) {
        Optional<UserEntity> existingUsername = userRepository.findByUsername(username);
        return existingUsername.isPresent();
    }

    public Boolean isEmailPresent(String email) {
        Optional<UserEntity> existingEmail = userRepository.findByEmail(email);
        return existingEmail.isPresent();
    }

    public Boolean isPhonePresent(String phone) {
        Optional<UserEntity> existingPhone = userRepository.findByPhone(phone);
        return existingPhone.isPresent();
    }

    @Transactional
    @CachePut(value = "userCache", key = "'user'+#user.id")
    public void saveUser(UserEntity user) {
        userRepository.save(user);
    }

    @Cacheable(value = "userCache", key = "'user'+#id")
    public UserEntity getUserByUserid(int id) {
        return userRepository.findById(id).orElse(null);
    }

    @Transactional
    @CacheEvict(value = "userCache", key = "'user'+#user.id")
    public void deleteUser(UserEntity user) {
        userRepository.delete(user);
    }

    public List<UserEntity> getAllUsers(int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        return userRepository.findAll(pageable).getContent();
    }

    @Cacheable(value = "userCache", key = "'userByMail'+#email")
    public UserEntity getUserByEmail(String email) {
        return userRepository.findByEmail(email).orElse(null);
    }
}
